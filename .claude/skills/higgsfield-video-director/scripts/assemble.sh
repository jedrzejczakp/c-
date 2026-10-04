#!/usr/bin/env bash
# Skleja klipy z Higgsfield w jeden pionowy film 9:16.
# Użycie: assemble.sh <nazwa_filmu> [--srt napisy.srt] <klip1> <klip2> ...
# Klip to ścieżka do pliku albo URL (pobierany przez curl).
# Wynik: video-library/renders/<nazwa_filmu>/final_clean.mp4 (bez napisów)
#        video-library/renders/<nazwa_filmu>/final.mp4 (z napisami, gdy podano --srt)
set -euo pipefail

if [ $# -lt 2 ]; then
  echo "Użycie: $0 <nazwa_filmu> [--srt napisy.srt] <klip1> <klip2> ..." >&2
  exit 1
fi

NAME="$1"; shift
SRT=""
if [ "${1:-}" = "--srt" ]; then SRT="$2"; shift 2; fi
[ $# -ge 1 ] || { echo "Brak klipów." >&2; exit 1; }

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
OUT="$ROOT/video-library/renders/$NAME"
WORK="$OUT/clips"
mkdir -p "$WORK"

W=1080; H=1920; FPS=30
i=0; INPUTS=(); FILTER=""
for SRC in "$@"; do
  i=$((i+1))
  RAW="$WORK/$(printf '%02d' "$i")_raw.mp4"
  if [[ "$SRC" =~ ^https?:// ]]; then
    curl -fsSL "$SRC" -o "$RAW"
  else
    cp "$SRC" "$RAW"
  fi
  NORM="$WORK/$(printf '%02d' "$i").mp4"
  # Klip w innych proporcjach jest przycinany do pełnego kadru 9:16, bez czarnych pasów.
  # Klip bez ścieżki audio dostaje ciszę, żeby concat miał równą liczbę strumieni.
  if ffprobe -v error -select_streams a -show_entries stream=index -of csv=p=0 "$RAW" | grep -q .; then
    ffmpeg -v error -y -i "$RAW" \
      -vf "scale=$W:$H:force_original_aspect_ratio=increase,crop=$W:$H,setsar=1,fps=$FPS" \
      -c:v libx264 -preset veryfast -crf 18 -pix_fmt yuv420p -c:a aac -ar 48000 -ac 2 "$NORM"
  else
    ffmpeg -v error -y -i "$RAW" -f lavfi -i anullsrc=r=48000:cl=stereo \
      -vf "scale=$W:$H:force_original_aspect_ratio=increase,crop=$W:$H,setsar=1,fps=$FPS" \
      -shortest -c:v libx264 -preset veryfast -crf 18 -pix_fmt yuv420p -c:a aac -ar 48000 -ac 2 "$NORM"
  fi
  INPUTS+=(-i "$NORM")
  FILTER+="[$((i-1)):v][$((i-1)):a]"
done
FILTER+="concat=n=$i:v=1:a=1[v][a]"

ffmpeg -v error -y "${INPUTS[@]}" -filter_complex "$FILTER" -map "[v]" -map "[a]" \
  -c:v libx264 -preset veryfast -crf 18 -pix_fmt yuv420p -c:a aac -movflags +faststart \
  "$OUT/final_clean.mp4"
echo "Zapisano: $OUT/final_clean.mp4"

if [ -n "$SRT" ]; then
  cp "$SRT" "$OUT/captions.srt"
  # Napisy w środkowej części kadru, poza strefą interfejsu TikToka (dół i prawa krawędź).
  STYLE="FontName=DejaVu Sans,FontSize=14,Bold=1,PrimaryColour=&H00FFFFFF,OutlineColour=&H00000000,BorderStyle=1,Outline=3,Shadow=0,Alignment=2,MarginV=85,MarginL=40,MarginR=90"
  (cd "$OUT" && ffmpeg -v error -y -i final_clean.mp4 \
    -vf "subtitles=captions.srt:force_style='$STYLE'" \
    -c:v libx264 -preset veryfast -crf 18 -pix_fmt yuv420p -c:a copy -movflags +faststart final.mp4)
  echo "Zapisano: $OUT/final.mp4"
fi

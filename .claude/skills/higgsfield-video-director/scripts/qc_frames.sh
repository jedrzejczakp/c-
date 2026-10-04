#!/usr/bin/env bash
# Wycina 6 klatek z klipu (początek, 20, 40, 60, 80 procent, koniec) i składa je w planszę 3x2.
# Użycie: qc_frames.sh <klip albo URL> <katalog_wyjściowy>
# Wynik: <katalog>/frame_1.png ... frame_6.png oraz <katalog>/sheet.png
set -euo pipefail
[ $# -eq 2 ] || { echo "Użycie: $0 <klip albo URL> <katalog_wyjściowy>" >&2; exit 1; }
SRC="$1"; OUT="$2"; mkdir -p "$OUT"
if [[ "$SRC" =~ ^https?:// ]]; then curl -fsSL "$SRC" -o "$OUT/clip.mp4"; SRC="$OUT/clip.mp4"; fi

DUR=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$SRC")
n=0
for P in 0.02 0.2 0.4 0.6 0.8 0.97; do
  n=$((n+1))
  T=$(awk -v d="$DUR" -v p="$P" 'BEGIN{printf "%.2f", d*p}')
  ffmpeg -v error -y -ss "$T" -i "$SRC" -frames:v 1 -vf "scale=540:-2,drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf:text='$T s':x=12:y=12:fontsize=28:fontcolor=white:box=1:boxcolor=black@0.6" "$OUT/frame_$n.png"
done
ffmpeg -v error -y -i "$OUT/frame_%d.png" -vf "tile=3x2:padding=6:color=white" -frames:v 1 "$OUT/sheet.png"
echo "Plansza: $OUT/sheet.png (długość klipu: $DUR s)"

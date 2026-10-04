#!/usr/bin/env bash
# Wykrywa cięcia w filmie i zapisuje pierwszą oraz ostatnią klatkę każdej sceny.
# Użycie: scene_frames.sh <film> <katalog_wyjściowy> [próg_cięcia, domyślnie 0.3]
# Wynik: <katalog>/scene_NN_first.png, scene_NN_end.png, scenes.csv (nr, start, koniec, długość)
set -euo pipefail
[ $# -ge 2 ] || { echo "Użycie: $0 <film> <katalog_wyjściowy> [próg]" >&2; exit 1; }
SRC="$1"; OUT="$2"; TH="${3:-0.3}"; mkdir -p "$OUT"

DUR=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$SRC")
# Czasy cięć z filtra scene (pts_time klatek, które różnią się od poprzedniej bardziej niż próg).
mapfile -t CUTS < <(ffmpeg -hide_banner -i "$SRC" -vf "select='gt(scene,$TH)',showinfo" -an -f null - 2>&1 \
  | grep -o 'pts_time:[0-9.]*' | cut -d: -f2)

BOUNDS=(0 "${CUTS[@]}" "$DUR")
echo "scena,start,koniec,dlugosc" > "$OUT/scenes.csv"
for ((k=0; k<${#BOUNDS[@]}-1; k++)); do
  S="${BOUNDS[$k]}"; E="${BOUNDS[$((k+1))]}"
  N=$(printf '%02d' $((k+1)))
  LEN=$(awk -v s="$S" -v e="$E" 'BEGIN{printf "%.2f", e-s}')
  # Scena krótsza niż 0.3 s to zwykle błysk albo przejście, pomijamy.
  awk -v l="$LEN" 'BEGIN{exit !(l<0.3)}' && continue
  FIRST=$(awk -v s="$S" 'BEGIN{printf "%.3f", s+0.05}')
  LAST=$(awk -v e="$E" 'BEGIN{printf "%.3f", e-0.1}')
  ffmpeg -v error -y -ss "$FIRST" -i "$SRC" -frames:v 1 "$OUT/scene_${N}_first.png"
  ffmpeg -v error -y -ss "$LAST" -i "$SRC" -frames:v 1 "$OUT/scene_${N}_end.png"
  echo "$N,$S,$E,$LEN" >> "$OUT/scenes.csv"
done
cat "$OUT/scenes.csv"

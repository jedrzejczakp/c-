#!/usr/bin/env bash
# Hook SessionStart: tworzy dziennik dnia i wstrzykuje do kontekstu lekcje oraz otwarte wiadomości.
set -u
ROOT="${CLAUDE_PROJECT_DIR:-$(cd "$(dirname "$0")/../.." && pwd)}"
cd "$ROOT" || exit 0

DZIS="$(date +%F)"
DZIENNIK="dziennik/$DZIS.md"
if [ ! -f "$DZIENNIK" ] && [ -f dziennik/_szablon.md ]; then
  sed "s/DATA/$DZIS/" dziennik/_szablon.md > "$DZIENNIK"
fi

echo "=== PAMIĘĆ FIRMY ($DZIS) ==="
echo "Dziennik dnia: $DZIENNIK. Zasady: CLAUDE.md."
echo
echo "--- Lekcje (wiedza/lekcje.md, najnowsze) ---"
awk '/^---$/{f=1;next} f' wiedza/lekcje.md 2>/dev/null | head -60
echo
echo "--- Otwarte wiadomości (komunikacja/tablica.md) ---"
awk '/^## Otwarte/{f=1;next} /^## Zamknięte/{f=0} f' komunikacja/tablica.md 2>/dev/null | head -60
echo
echo "--- Ostatni wpis postępów (wiedza/postepy.md) ---"
awk '/^---$/{f=1;next} f' wiedza/postepy.md 2>/dev/null | head -10
exit 0

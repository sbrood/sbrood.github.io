#!/usr/bin/env bash
# Regenerates files/cv_sarah_brood.pdf from the live /cv/ page, so the PDF can
# never drift from the site. Needs Google Chrome and a running local server.
#
#   pixi run serve          # in another terminal
#   ./bin/make-cv-pdf.sh
set -euo pipefail

CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
URL="${1:-http://127.0.0.1:4000/cv/}"
OUT="files/cv_sarah_brood.pdf"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

[ -x "$CHROME" ] || { echo "Google Chrome introuvable"; exit 1; }
curl -sf -o /dev/null "$URL" || { echo "Rien ne répond sur $URL — lance 'pixi run serve'"; exit 1; }

# Chrome sometimes writes the PDF and then keeps running, so it is started in
# the background and killed once the file is there. Without this the script
# hangs instead of finishing.
"$CHROME" --headless=new --disable-gpu --no-first-run --no-default-browser-check \
  --user-data-dir="$TMP/profile" --no-pdf-header-footer \
  --virtual-time-budget=15000 --run-all-compositor-stages-before-draw \
  --print-to-pdf="$TMP/cv.pdf" "$URL" >"$TMP/chrome.log" 2>&1 &
CHROME_PID=$!

for _ in $(seq 1 90); do
  [ -s "$TMP/cv.pdf" ] && { sleep 2; break; }
  kill -0 "$CHROME_PID" 2>/dev/null || break
  sleep 1
done
kill "$CHROME_PID" 2>/dev/null || true
wait "$CHROME_PID" 2>/dev/null || true

[ -s "$TMP/cv.pdf" ] || { echo "Chrome n'a rien produit :"; tail -5 "$TMP/chrome.log"; exit 1; }

# The backup goes OUTSIDE the site: anything left in files/ is published, and an
# older CV may carry a postal address or a phone number.
BACKUP_DIR="$(cd .. && pwd)/cv-backups"
mkdir -p "$BACKUP_DIR"
if [ -f "$OUT" ]; then cp "$OUT" "$BACKUP_DIR/cv_$(date +%Y%m%d-%H%M%S).pdf"; fi
cp "$TMP/cv.pdf" "$OUT"

echo "Écrit : $OUT ($(du -h "$OUT" | cut -f1))"
echo "Sauvegarde hors du site : $BACKUP_DIR"

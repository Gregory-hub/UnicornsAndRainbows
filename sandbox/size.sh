#!/bin/sh
# Zip a sandbox prototype and report its size against the js13k 13,312-byte limit.
# Usage: ./sandbox/size.sh <prototype-folder>
set -e

LIMIT=13312
DIR=$(cd "$(dirname "$0")" && pwd)
NAME=${1:?usage: size.sh <prototype-folder>}
SRC="$DIR/${NAME%/}"

[ -d "$SRC" ] || { echo "no such prototype: $SRC" >&2; exit 1; }
[ -f "$SRC/index.html" ] || { echo "missing index.html in $SRC" >&2; exit 1; }

OUT="$DIR/.build/$(basename "$SRC").zip"
mkdir -p "$(dirname "$OUT")"
rm -f "$OUT"

# -X drops extra file attributes; -9 max deflate. Paths stay relative so
# index.html lands in the archive root, as the rules require.
(cd "$SRC" && zip -q -X -9 -r "$OUT" . -x '.*' '*/.*')

SIZE=$(wc -c < "$OUT" | tr -d ' ')
LEFT=$((LIMIT - SIZE))
PCT=$((SIZE * 100 / LIMIT))

printf '%s: %s bytes (%d%% of 13312)\n' "$(basename "$SRC")" "$SIZE" "$PCT"
if [ "$LEFT" -ge 0 ]; then
  printf 'fits — %s bytes to spare\n' "$LEFT"
else
  printf 'OVER by %s bytes\n' "$((-LEFT))"
  exit 1
fi

#!/usr/bin/env sh

if [ "$#" -lt 3 ]; then
    echo "USAGE: $0 file parts outdir" > /dev/stderr
    exit 1
fi

file="$1"
parts="$2"
outdir="$3"

test -d "$outdir" && rm -rf "$outdir"
mkdir "$outdir"

# assumes video < 1minute
length="$(ffprobe "$file" 2>&1 \
    | grep -E '^\s*Duration' \
    | cut -d ':' -f4 \
    | cut -d',' -f1)"

millis="$(echo "$length * 1000" | bc -l | cut -d'.' -f1)"
partlen="$(($millis/$parts))"

i=0
while [ "$i" -lt "$millis" ]; do
    echo "Making cut $i-$(($i + $partlen))"
    outname="$(printf "%05d" "$i")"
    ffmpeg -i "$file" -ss "${i}ms" -t "${partlen}ms" "$outdir/$outname.mp4" 2>/dev/null
    i="$(($i + $partlen))"
done


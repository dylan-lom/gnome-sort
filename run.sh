#!/usr/bin/env sh

if [ "$#" -lt 3 ]; then
    echo "USAGE: $0 infile parts outfile" > /dev/stderr
    exit 1
fi

infile="$1"
parts="$2"
outfile="$3"

cc -Wall -Wextra -o shuffle shuffle.c
cc -Wall -Wextra -o gnomesort gnomesort.c

./split.sh "$infile" "$parts" "./.parts" || exit
./shuffle .parts/* | ./gnomesort $(cat -) > .list.txt || exit

sed -i "s/^/file '/" .list.txt
sed -i "s/$/'/" .list.txt

# unsafe code T.T... program is unusable...
# i think we need this because we store in a hidden directory which ffmpeg
# treats as relative or something? https://stackoverflow.com/a/56029574
ffmpeg -f concat -safe 0 -i .list.txt -c copy "$outfile"

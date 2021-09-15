gnome sort
==========

Slices up a video an generates a [sorting alogirthm-style video][1]
demonstrating this [superb algorithm's][2] performance.

[Example output on YouTube][3]

Usage
-----

```console
# ./run.sh in slices out
./run.sh smolgnome.mp4 10 sortedgnome.mp4
```

(the script also builds the `.c` programs for ease of use)

Notes
-----

Depends on [ffmpeg][4] for slicing and re-combining video chunks

Probably won't work with big videos, has trouble with more parts (>20).

Stores the chunks in `./.parts`, feel free to delete that once you're done...

References
----------
[Sorting algorithms on YouTube][1]

[Gnome sort on Wikipedia][2]

[FFmpeg][4]

[1]: https://www.youtube.com/watch?v=t8g-iYGHpEA
[2]: https://en.wikipedia.org/wiki/Gnome_sort#Description
[3]: https://youtu.be/7e8EcY_CwaE
[4]: https://ffmpeg.org/



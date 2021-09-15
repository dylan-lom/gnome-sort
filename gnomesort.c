#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// https://en.wikipedia.org/wiki/Gnome_sort#Description
void
gnomesort(size_t len, char *a[])
{
     size_t pos = 0;
     while (pos < len) {
        if (pos == 0 || strcmp(a[pos], a[pos-1]) >= 0) {
            printf("%s\n", a[pos++]);
        } else {
            // swap
            char *t = a[pos];
            a[pos] = a[pos-1];
            a[pos-1] = t;
            printf("%s\n", a[pos--]);
        }

     }
}


// Arguments are things to be sorted!
int
main(int argc, char *argv[])
{
    gnomesort(--argc, ++argv);

    for (int i = 0; i < argc; i++) {
        printf("%s\n", argv[i]);
    }
}

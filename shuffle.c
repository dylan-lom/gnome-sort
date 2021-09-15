#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void
shuffle(int len, char *a[])
{
    for (int i = 0; i < len*2; i++) {
        int x = rand() % len;
        char *t = a[x];
        int y = rand() % len;
        a[x] = a[y];
        a[y] = t;
    }
}

int
main(int argc, char *argv[])
{
    srand(time(NULL));
    shuffle(--argc, ++argv);
    for (int i = 0; i < argc; i++) {
        printf("%s\n", argv[i]);
    }
}

#include "libfoo.h"

int fooadd(int argc, ...)
{
    if (argc < 1) return;

    va_list argptr;
    va_start(argptr, argc);

    int sum = 0;

    for (int i = 0; i < argc; i++)
    {
        int n = va_arg(argptr, int);
        if (i > 0) printf("+%i", n);
        else printf("%i", n);
        sum += n;
    }

    va_end(argptr);
    printf("=%i\n", sum);
    return sum;
}
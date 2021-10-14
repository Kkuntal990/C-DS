#include <time.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>
int arr[100];


int tob(long long b)
{
    int i;
    for (i = 0; b > 0; i++)
    {
        if (b & 1)
            arr[i] = 1;
        else
            arr[i] = 0;
        b = b / 2;
    }
    return (i);
}

long long pp(int a, long long b)
{
    int i, tot = 1, ex, len;
    ex = a;

    len = tob(b);
    for (i = 0; i < len; i++)
    {
        if (arr[i] == 1)
            tot = tot * ex;
        ex = ex * ex;
    }

    return tot;
}

int main()
{

    long long b = 4;
    printf("pp(%d, %lld) = %lld\n", 3, b, pp(3, b));

    struct timespec ts1, ts2;
    int dummy;
    FILE* fp = fopen("Assignment1/codes/complexity.dat", "w");
    for (int i = 0; i < 1000000; i++)
    {
        clock_gettime(CLOCK_REALTIME, &ts1);

        dummy = tob(i);
        //printf("%d\n", dummy);

        clock_gettime(CLOCK_REALTIME, &ts2);
        fprintf(fp, "%d 0.%09ld \n", i, ts2.tv_nsec - ts1.tv_nsec);
    }
    fclose(fp);

    return 0;
}
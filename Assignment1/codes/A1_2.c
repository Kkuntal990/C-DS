#include <stdio.h>

int arr[20];

int tob(int b)
{
    int i;
    for (i = 0; b > 0; i++)
    {
        if (b % 2)
            arr[i] = 1;
        else
            arr[i] = 0;
        b = b / 2;
    }

    return (i);
}

int pp(int a, int b)
{
    int i, tot = 1, ex, len;
    ex = a;

    len = tob(b);
    printf("len = %d \n", len);
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
    int a, b;
    printf("Please input \" a \" and \" b \" in order \n");
    scanf("%d %d", &a, &b);
    printf("pp(%d, %d) = %d\n", a, b, pp(a, b));

    return 0;
}
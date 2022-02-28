#include <stdio.h>
#include <x86intrin.h>

unsigned long int squareSum(int n)
{
    unsigned long int tic, toc;
    unsigned int ui;
    int a = 0;
    tic = __rdtscp(&ui);
    for (int i = 0; i < n; ++i)
    {
        a = a * a + a * a;
    }
    toc = __rdtscp(&ui);
    return toc - tic;
}

int main()
{
    printf("n=%d: %lu tics\n", 1000, squareSum(1000));
    printf("n=%d: %lu tics\n", 10000, squareSum(10000));
    printf("n=%d: %lu tics\n", 1000000, squareSum(1000000));
    printf("n=%d: %lu tics\n", 10000000, squareSum(10000000));
    printf("n=%d: %lu tics\n", 100000000, squareSum(100000000));
    return 0;
}
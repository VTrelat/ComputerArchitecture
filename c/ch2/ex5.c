#include <stdio.h>
#include <x86intrin.h>

void acces(int *tab, int n)
{
    int tmp;
    for (int i = 0; i < n; i++)
    {
        tmp = tab[i];
    }
}

int main()
{
    int *tab = malloc(1000000000 * sizeof(int));
    for (unsigned long int i = 1000; i < 1000000000; i *= 10)
    {
        unsigned long int tic, toc;
        unsigned int ui;
        for (int j = 1; j < 4; j++)
        {
            tic = __rdtscp(&ui);
            acces(tab, i);
            toc = __rdtscp(&ui);
            printf("[n=%lu][call: %d] time: %lu\n", i, j, tic - toc);
        }
    }
    return 0;
}
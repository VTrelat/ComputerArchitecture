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
    for (unsigned long int i = 1000; i < 1000000001; i *= 10)
    {
        unsigned long int tic, toc;
        unsigned int ui;
        unsigned long int min;
        unsigned long int max;
        unsigned long int sum = 0;
        for (int j = 1; j < 4; j++)
        {
            tic = __rdtscp(&ui);
            acces(tab, i);
            toc = __rdtscp(&ui);
            unsigned long int time = toc - tic;
            sum += time;
            if (j == 1)
            {
                min = time;
                max = time;
            }
            else
            {
                if (min > time)
                {
                    min = time;
                }
                if (max < time)
                {
                    max = time;
                }
            }
            printf("[n=%lu][call: %d] time: %lu\n", i, j, time);
        }
        printf("max gap / mean: %f\n", 300 * (float)(max - min) / (sum));
    }
    return 0;
}
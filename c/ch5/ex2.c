#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <x86intrin.h>

int *make_random_table(int n)
{
    int *table;
    register int i;

    table = malloc(n * sizeof(int));
    if (table == NULL)
        return NULL;

    for (i = 0; i < n; i++)
        table[i] = rand() % 100;

    return table;
}

int count_less_than(int *tab, int n, int threshold)
{
    register int i;
    register int count = 0;

    for (i = 0; i < n; i++)
        if (tab[i] < threshold)
            count++;

    return count;
}

void print_timing(int *tab, int n, int threshold, int (*func)(int *, int, int), int nb_boot, int nb_call)
{
    int s = 0;
    // boot
    for (int i = 0; i < nb_boot; i++)
    {
        s += func(tab, n, threshold);
    }

    // measure
    unsigned long int tic, toc;
    unsigned int ui;
    tic = __rdtscp(&ui);
    for (int i = 0; i < nb_call; i++)
    {
        s += func(tab, n, threshold);
    }
    toc = __rdtscp(&ui);

    printf("%lu\n", (toc - tic) / nb_call);
}

int main(void)
{
    int *table;

    srand(time(NULL));
    table = make_random_table(10000000);
    printf("i t\n");
    for (register int i = 0; i < 100; i++)
    {
        printf("%d ", i);
        print_timing(table, 10000000, i, count_less_than, 100, 1000);
    }
    free(table);

    return 0;
}
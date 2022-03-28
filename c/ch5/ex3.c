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

int count1(int *tab, int n)
{
    register int i;
    register int count = 0;

    for (i = 0; i < n; i++)
        if (tab[i] > 24)
        {
            if (tab[i] < 51)
            {
                count++;
            }
        }

    return count;
}

int count2(int *tab, int n)
{
    register int i;
    register int count = 0;

    for (i = 0; i < n; i++)
        if (tab[i] < 51)
        {
            if (tab[i] > 24)
            {
                count++;
            }
        }

    return count;
}

void print_timing(int *tab, int n, int (*func)(int *, int), int nb_boot, int nb_call)
{
    int s = 0;
    // boot
    for (int i = 0; i < nb_boot; i++)
    {
        s += func(tab, n);
    }

    // measure
    unsigned long int tic, toc;
    unsigned int ui;
    tic = __rdtscp(&ui);
    for (int i = 0; i < nb_call; i++)
    {
        s += func(tab, n);
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
    printf("count1: ");
    print_timing(table, 10000000, count1, 20, 100);
    printf("count2: ");
    print_timing(table, 10000000, count2, 20, 100);
    free(table);

    return 0;
}
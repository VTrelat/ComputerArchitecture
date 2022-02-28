#include <stdio.h>
#include <x86intrin.h>

void espacement(int *tab, int pas)
{
    int tmp;
    register unsigned long int i = 0;
    register unsigned long int bound = pas * (unsigned long int)10000000;
    while (i < bound)
    {
        tmp = tab[i % 1000000000];
        i += pas;
    }
}

void print_timing(int *arg1, int arg2, void (*func)(int *, int), int nb_boot, int nb_call)
{
    // amorçage
    for (int i = 0; i < nb_boot; i++)
    {
        func(arg1, arg2);
    }

    // mesure du temps
    unsigned long int tic, toc;
    unsigned int ui;
    tic = __rdtscp(&ui);

    for (int i = 0; i < nb_call; i++)
    {
        func(arg1, arg2);
    }

    toc = __rdtscp(&ui);
    printf("%lu\n", (toc - tic) / nb_call);
}

int main()
{
    int *tab = malloc(1000000000 * sizeof(int));
    printf("i t\n");
    for (int i = 0; i < 1001; i += 20)
    {
        printf("%d ", i);
        print_timing(tab, i, espacement, 2, 3);
    }
    return 0;
}
#include <stdio.h>
#include <stdlib.h>
#include <x86intrin.h>
#include <time.h>

void print_timing(int *arg1, unsigned long int *arg2, unsigned long int arg3, void (*func)(int *, unsigned long int *, unsigned long int), int nb_boot, int nb_call)
{
    // votre code peut appeler la fonction à mesurer
    // par ma_fonction(arg)
    // il doit afficher (printf) le résultat de la mesure

    // amorçage
    for (int i = 0; i < nb_boot; i++)
    {
        func(arg1, arg2, arg3);
    }

    // mesure du temps
    unsigned long int tic, toc;
    unsigned int ui;
    tic = __rdtscp(&ui);
    for (int i = 0; i < nb_call; i++)
    {
        func(arg1, arg2, arg3);
    }
    toc = __rdtscp(&ui);

    printf("%lu\n", (toc - tic) / nb_call);
}

void access_seq(int *tab, int n)
{
    int tmp;
    for (register unsigned long int i = 0; i < n; i++)
    {
        tmp = tab[i];
    }
}

void access_rand(int *tab, int n)
{
    int tmp;
    for (register unsigned long int i = 0; i < n; i++)
    {
        tmp = tab[(unsigned long int)rand() % 1000000000];
    }
}

void access_aux(int *tab, unsigned long int *aux, unsigned long int n)
{
    int tmp;
    for (register unsigned long int i = 0; i < n; i++)
    {
        tmp = tab[aux[i]];
    }
}

unsigned long int *makeRandTab(unsigned long int size)
{
    unsigned long int *tab = malloc(size * sizeof(unsigned long int));
    for (unsigned long int i = 0; i < size; i++)
    {
        tab[i] = (unsigned long int)rand() % size;
    }
    return tab;
}

unsigned long int *makeOrderedTab(unsigned long int size)
{
    unsigned long int *tab = malloc(size * sizeof(unsigned long int));
    for (unsigned long int i = 0; i < size; i++)
    {
        tab[i] = i;
    }
    return tab;
}

int main()
{
    srand((unsigned int)time(NULL));

    int *tab = malloc(1000000000 * sizeof(int));
    printf("i t (seq)\n");
    for (unsigned long int i = 1000; i <= 1000000000; i *= 10)
    {
        unsigned long int *auxOrdered = makeOrderedTab(i);
        printf("%lu ", i);
        print_timing(tab, auxOrdered, i, access_aux, 5, 10);
    }
    printf("i t (rand)\n");
    for (unsigned long int i = 1000; i <= 1000000000; i *= 10)
    {
        unsigned long int *auxRand = makeRandTab(i);
        printf("%lu ", i);
        print_timing(tab, auxRand, i, access_aux, 0, 2);
    }
    return 0;
}
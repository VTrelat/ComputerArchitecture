#include <stdio.h>
#include <x86intrin.h>

void test(int a)
{
    int s = 0;
    for (int i = 0; i < a; i++)
    {
        s += i * i;
    }
}

void acces(int *tab, int n)
{
    int tmp;
    for (int i = 0; i < n; i++)
    {
        tmp = tab[i];
    }
}

void print_timing(int *arg1, int arg2, void (*func)(int *, int), int nb_boot, int nb_call)
{
    // votre code peut appeler la fonction à mesurer
    // par ma_fonction(arg)
    // il doit afficher (printf) le résultat de la mesure

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

    printf("average time : %lu\n", (toc - tic) / nb_call);
}

int main()
{
    int *tab = malloc(1000000000 * sizeof(int));
    for (unsigned long int i = 1000; i < 1000000001; i *= 10)
    {
        printf("[i=%lu]\n", i);
        print_timing(tab, i, acces, 5, 10);
    }
    return 0;
}
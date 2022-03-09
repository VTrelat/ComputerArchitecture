#include <stdio.h>
#include <x86intrin.h>

int byLine(int *tab, int N)
{
    int dum = 0;
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++)
            dum += tab[i * N + j]; // read along lines
    return dum;
}

int byColumn(int *tab, int N)
{
    int dum = 0;
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++)
            dum += tab[j * N + i]; // read along columns
    return dum;
}

void print_avg_timing(int *arg1, int arg2, int (*func)(int *, int), int nb_boot, int nb_call)
{
    // boot
    for (int i = 0; i < nb_boot; i++)
    {
        func(arg1, arg2);
    }

    // measure
    unsigned long int tic, toc;
    unsigned int ui;
    tic = __rdtscp(&ui);
    for (int i = 0; i < nb_call; i++)
    {
        func(arg1, arg2);
    }
    toc = __rdtscp(&ui);

    printf("%lu\n", (toc - tic) / (arg2 * nb_call));
}

void access(int *tab, unsigned long int size)
{
    int s = 0;
    for (unsigned long int i = 0; i < size; i++)
    {
        s += i;
    }
}

int main()
{
    // printf("N t (lin)\n");
    // for (int N = 50; N <= 500; N += 2)
    // {
    //     int *tab = malloc(N * N * sizeof(int));
    //     printf("%d ", N);
    //     print_avg_timing(tab, N, byLine, 30, 50);
    //     free(tab);
    //     access(aux, 32768);
    // }
    printf("N t (col)\n");
    for (int N = 100; N <= 700; N += 10)
    {
        int *tab = malloc(N * N * sizeof(int));
        printf("%d ", N);
        print_avg_timing(tab, N, byColumn, 10, 50);
        free(tab);
        int *aux = malloc(16777217 * sizeof(int));
        access(aux, 16777217); // tableau de la taille du cache L1 pour écraser les valeurs actuelles
    }
}
// rm ex4.txt; ./a.out >> ex4.txt; rm ex4a ex4b; split -a 1 -p "N" ex4.txt ex4
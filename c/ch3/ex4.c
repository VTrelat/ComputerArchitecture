#include <stdio.h>
#include <x86intrin.h>

int f1(int *tab, unsigned long int N)
{
    int dum = 0;
    for (unsigned long int i = 0; i < N; i++)
        for (unsigned long int j = 0; j < N; j++)
            dum += tab[i * N + j]; // read along lines
    return dum;
}

int f2(int *tab, unsigned long int N)
{
    int dum = 0;
    for (unsigned long int i = 0; i < N; i++)
        for (unsigned long int j = 0; j < N; j++)
            dum += tab[j * N + i]; // read along columns
    return dum;
}

void print_avg_timing(int *arg1, unsigned long int arg2, int (*func)(int *, unsigned long int), int nb_boot, int nb_call)
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
    int s;
    for (unsigned long int i = 0; i < size; i++)
    {
        s = i;
    }
}

int main()
{
    int *aux = malloc(100000000 * sizeof(int));
    printf("N t (f1)\n");
    for (unsigned long int N = 400; N <= 4000; N += 50)
    {
        int *tab = malloc(N * N * sizeof(int));
        printf("%lu ", N);
        print_avg_timing(tab, N, f1, 5, 5);
        free(tab);
        access(aux, 100000000);
    }
    printf("N t (f2)\n");
    for (unsigned long int N = 400; N <= 4000; N += 50)
    {
        int *tab = malloc(N * N * sizeof(int));
        printf("%lu ", N);
        print_avg_timing(tab, N, f1, 5, 5);
        free(tab);
        access(aux, 100000000);
    }
}
// rm ex4.txt; ./a.out >> ex4.txt; rm ex4a ex4b; split -a 1 -p "N" ex4.txt ex4
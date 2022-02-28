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

void print_timing(int arg, void (*func)(int))
{
    // votre code peut appeler la fonction à mesurer
    // par ma_fonction(arg)
    // il doit afficher (printf) le résultat de la mesure

    // amorçage
    for (int i = 0; i < 5; i++)
    {
        func(arg);
    }

    // mesure du temps
    unsigned long int tic, toc;
    unsigned int ui;
    int n = 100;
    tic = __rdtscp(&ui);
    for (int i = 0; i < n; i++)
    {
        func(arg);
    }
    toc = __rdtscp(&ui);

    printf("average time : %lu\n", (toc - tic) / n);
}

int main()
{
    print_timing(10000000, test);
    return 0;
}
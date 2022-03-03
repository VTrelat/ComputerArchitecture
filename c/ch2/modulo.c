#include <stdio.h>
#include <stdlib.h>
#include <x86intrin.h>
#include <time.h>

float get_timing(int arg1, int arg2, void (*func)(int, int), int nb_boot, int nb_call)
{
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

    return (toc - tic) / nb_call;
}

void modulo(int a, int b)
{
    unsigned long int c = a % b;
}

int main()
{
    srand((unsigned int)time(NULL));
    float s = 0.0;
    for (int i = 0; i <= 1000000; i++)
    {
        int a = rand() % 1000000;
        int b = (rand() % 1000000) + 1;
        s += get_timing(a, b, modulo, 10, 50);
    }
    printf("%f\n", s / 1000000);
    return 0;
}
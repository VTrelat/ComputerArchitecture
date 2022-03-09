#include <stdio.h>
#include <x86intrin.h>
#include <stdlib.h>
#include <time.h>

int comparator(const void *p1, const void *p2)
{
    return (*(unsigned long int *)p1 - *(unsigned long int *)p2);
};

int binarySearch(unsigned long int arr[], unsigned long int l, unsigned long int r, unsigned long int x)
{
    if (r >= l)
    {
        unsigned long int mid = l + (r - l) / 2;
        // printf("l: %lu r: %lu\n", l, r);
        // printf("arr[%lu] = %lu <-> %lu\n", mid, arr[mid], x);
        if (arr[mid] == x)
            return mid;

        if (arr[mid] > x)
        {
            return binarySearch(arr, l, mid - 1, x);
        }
        return binarySearch(arr, mid + 1, r, x);
    }
    return -1;
}

int isSorted(unsigned long int *tab, unsigned long int size)
{
    for (unsigned long int i = 0; i < size - 1; i++)
    {
        if (tab[i] > tab[i + 1])
        {
            return 0;
        }
    }
    return 1;
}

unsigned long int *makeRandTab(unsigned long int size, unsigned long int bound)
{
    unsigned long int *tab = malloc(size * sizeof(unsigned long int));
    for (unsigned long int i = 0; i < size; i++)
    {
        tab[i] = (unsigned long int)rand() % bound;
    }
    return tab;
}

void print_timing(unsigned long int tab[], unsigned long int l, unsigned long int r, unsigned long int x, int (*func)(unsigned long int *, unsigned long int, unsigned long int, unsigned long int), int nb_boot, int nb_call)
{
    int s = 0;
    // boot
    for (int i = 0; i < nb_boot; i++)
    {
        s += func(tab, l, r, x);
    }

    // measure
    unsigned long int tic, toc;
    unsigned int ui;
    tic = __rdtscp(&ui);
    for (int i = 0; i < nb_call; i++)
    {
        s += func(tab, l, r, x);
    }
    toc = __rdtscp(&ui);

    printf("%lu\n", (toc - tic) / nb_call);
}

int main()
{
    srand((unsigned int)time(NULL));
    unsigned long int *tab;
    unsigned long int N;
    unsigned long int R = 10000;
    unsigned long int T = 100000000;
    unsigned long int *req = makeRandTab(R, T);

    N = 1000000; // 1000000, 1048576, 1300000
    tab = makeRandTab(N, T);
    qsort(tab, N, sizeof(unsigned long int), comparator);
    printf("i t\n");
    for (unsigned long int i = 0; i < R; i++)
    {
        printf("%lu ", i);
        print_timing(tab, 0, N - 1, req[i], binarySearch, 100, 3000);
        // printf("[%d]\n", binarySearch(tab, 0, N - 1, req[i]));
    }

    N = 1048576; // 1000000, 1048576, 1300000
    tab = makeRandTab(N, T);
    qsort(tab, N, sizeof(unsigned long int), comparator);
    printf("i t\n");
    for (unsigned long int i = 0; i < R; i++)
    {
        printf("%lu ", i);
        print_timing(tab, 0, N - 1, req[i], binarySearch, 100, 3000);
        // printf("[%d]\n", binarySearch(tab, 0, N - 1, req[i]));
    }

    N = 1300000; // 1000000, 1048576, 1300000
    tab = makeRandTab(N, T);
    qsort(tab, N, sizeof(unsigned long int), comparator);
    printf("i t\n");
    for (unsigned long int i = 0; i < R; i++)
    {
        printf("%lu ", i);
        print_timing(tab, 0, N - 1, req[i], binarySearch, 100, 3000);
        // printf("[%d]\n", binarySearch(tab, 0, N - 1, req[i]));
    }

    return 0;
}

// rm ex7.txt; ./a.out >> ex7.txt; rm ex7a ex7b ex7c ; split -a 1 -p "i" ex7.txt ex7; python avgtime.py
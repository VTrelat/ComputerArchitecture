#include <stdio.h>

int min(int *tab, int n)
{
    int min = tab[0];
    int i;
    for (i = 1; i < n; i++)
    {
        if (tab[i] < min)
        {
            min = tab[i];
        }
    }
    return min;
}
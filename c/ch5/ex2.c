#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int *make_random_table(int n)
{
    int *table;
    int i;

    table = malloc(n * sizeof(int));
    if (table == NULL)
        return NULL;

    for (i = 0; i < n; i++)
        table[i] = rand();

    return table;
}

int main(void)
{
    int *table;
    int i;

    srand(time(NULL));
    table = make_random_table(10);
    if (table == NULL)
    {
        printf("Memory allocation failed.\n");
        return 1;
    }

    for (i = 0; i < 10; i++)
        printf("%d ", table[i]);
    printf("\n");

    free(table);
    return 0;
}
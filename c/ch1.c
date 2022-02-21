#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main()
{
    printf("%lu, %lu, %lu\n", sizeof(int), sizeof(short), sizeof(char));
    int a = pow(2, 31);
    int b = pow(2, 31);
    int c = a + b;
    printf("%d\n", c);
    return 0;
}
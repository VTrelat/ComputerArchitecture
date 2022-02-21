#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main()
{
    int a = pow(2, 31);
    int b = pow(2, 31);
    int c = a + b;
    printf("%d\n", c);
    return 0;
}
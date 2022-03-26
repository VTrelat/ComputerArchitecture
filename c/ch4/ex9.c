#include <stdio.h>

int u(u0, n)
{
    if (n == 0)
        return u0;
    else
    {
        int tmp = u(u0, n - 1);
        if (tmp % 2 == 0)
            return tmp / 2;
        else if (tmp == 1)
            return 1;
        else
            return 3 * tmp + 1;
    }
}

int main()
{
    int a = 3;
    int n = 100;
    printf("%d\n", u(a, n));
    return 0;
}
#include <stdio.h>
#include <string.h>

int main() {
    float s1 = 0.0, s2 = 0.0;
    long k = 1000000000;
    for (double i = 1; i<k+1; i++){
        s1 += 1/i;
        s2 += 1/(k+1-i);
    }
    printf("k=%ld\n    s1 = %.16f\n    s2 = %.16f\n", k, s1, s2);
    return 0;
}
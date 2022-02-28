#include <stdio.h>
#include <string.h>

int main() {
    unsigned char c = 150;
    signed char d;
    memcpy(&d, &c, 1);
    printf("%hhi\n", d);
}
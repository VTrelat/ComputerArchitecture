#include <stdio.h>
#include <string.h>

int main() {
    unsigned char c = 150;
    unsigned char* p;
    signed char* q;
    p = &c;
    memcpy(&q, &p, sizeof(p));
    printf("%hhu\n", *p);
    printf("%hhi\n", *q);
}
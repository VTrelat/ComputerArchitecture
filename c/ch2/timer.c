#include <stdio.h>
#include <stdlib.h>
#include <x86intrin.h>

unsigned long int test(int MAX){
        unsigned long int tic,toc;
        unsigned int ui;
        int a = 2;
        tic = __rdtscp(&ui);
        for (int i=0; i < MAX; ++i)
        a = a*a;
        toc = __rdtscp(&ui);
        return toc-tic;
    }

int main(){
    printf("%lu tics\n", test(100));
    return 0;
}
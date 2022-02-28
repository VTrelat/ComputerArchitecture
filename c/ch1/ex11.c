#include <stdio.h>
#include <string.h>

int main() {
    for (int i = 0; i<10; i++){
        for (int j = 0; j < 10; j++){
            float a = i/10.0, b = j/10.0, c = (i+j)/10.0;
            if(a+b!=c){
                int m1 = a+b>c;
                int m2 = a+b+.000001>c+.000001;
                printf("(%d, %d) : %d %d\n", i, j, m1, m2);
            }
        }
    } 
    return 0;
}
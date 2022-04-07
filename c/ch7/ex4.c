#include <stdlib.h>

char *flatten(char *image, int WIDTH, int HEIGHT)
{
    int U = WIDTH * HEIGHT;
    int V = 1;
    // int U = 1;
    // int V = 3;
    char *dest = malloc(WIDTH * HEIGHT * 3);
    int i, moy;
    char gris;

    for (i = 0; i < WIDTH * HEIGHT; i++)
    {
        moy = (int)image[V * i] + (int)image[V * i + U] + (int)image[V * i + 2 * U];
        moy /= 3;
        gris = (char)moy;
        dest[V * i] = gris;
        dest[V * i + U] = gris;
        dest[V * i + 2 * U] = gris;
    }

    return dest;
}
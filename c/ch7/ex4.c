#include <stdio.h>

#define U 1
#define V 2

int main()
{
    int LARGEUR = 1600;
    int HAUTEUR = 1000;

    char *image = malloc(LARGEUR * HAUTEUR * 3);

    char *dest = malloc(LARGEUR * HAUTEUR * 3);
    int i, moy;
    char gris;

    for (i = 0; i < LARGEUR * HAUTEUR; i++)
    {
        moy = (int)image[V * i] + (int)image[V * i + U] + (int)image[V * i + 2 * U];
        moy /= 3;
        gris = (char)moy;
        dest[V * i] = gris;
        dest[V * i + U] = gris;
        dest[V * i + 2 * U] = gris;
    }

    return 0;
}
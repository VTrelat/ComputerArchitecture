#include <stdio.h>
#include <x86intrin.h>

struct noeud
{
    int valeur;
    struct noeud *prec;
    struct noeud *suiv;
};

int main()
{
    printf("sizeof noeud: %lu o\n", sizeof(struct noeud));
    return 0;
}
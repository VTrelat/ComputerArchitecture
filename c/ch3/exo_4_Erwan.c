#include <stdlib.h>
#include <stdio.h>
#include <x86intrin.h>


void print_timing(unsigned long int *arg1, int arg2, int (*func)(unsigned long int *, int), int nb_boot, int nb_call);
int code_1(unsigned long int* tab, int N);
int code_2(unsigned long int* tab, int N);


int main() {
  //printf("%ld", sizeof(unsigned long int));
  for (int N=300; N<800; N += 2) {
    unsigned long int *tab = malloc(N*N*sizeof(unsigned long int));
    printf("%d\n", N);
    print_timing(tab, N, code_2, 5, 10);
    //print_timing(tab, N, code_2, 5, 10);
    free(tab);
    unsigned long int *vide_cache = malloc(32768*sizeof(unsigned long int));
    code_2(vide_cache,181); //ne marche pas, il faut un tableau de la taille du cache
  }

  return 0;
}

void print_timing(unsigned long int *arg1, int arg2, int (*func)(unsigned long int *, int), int nb_boot, int nb_call)
{
    // votre code peut appeler la fonction à mesurer
    // par ma_fonction(arg)
    // il doit afficher (printf) le résultat de la mesure

    // amorçage
    for (int i = 0; i < nb_boot; i++)
    {
        func(arg1, arg2);
    }

    // mesure du temps
    unsigned long int tic, toc;
    unsigned int ui;
    tic = __rdtscp(&ui);
    for (int i = 0; i < nb_call; i++)
    {
        func(arg1, arg2);
    }
    toc = __rdtscp(&ui);

    printf("average time : %lu\n", (toc - tic) / (nb_call*arg2));
}

int code_1(unsigned long int* tab, int N) {
  int dum = 0;
  for (int i=0; i<N; i++)
  {
    for (int j=0; j<N; j++)
    {
      dum += tab[i*N+j];
    }
  }
  return dum;
}

int code_2(unsigned long int* tab, int N) 
{
  int dum = 0;
  for (int i=0; i<N; i++)
  {
    for (int j=0; j<N; j++)
    {
      dum += tab[j*N+i];
    }
  }
  return dum;
}

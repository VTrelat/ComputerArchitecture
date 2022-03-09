#include <stdio.h>
#include <x86intrin.h>

int byLine(int *tab, int N)
{
  int dum = 0;
  for (int i = 0; i < N; i++)
    for (int j = 0; j < N; j++)
      dum += tab[i * N + j]; // read along lines
  return dum;
}

int byColumn(int *tab, int N)
{
  int dum = 0;
  for (int i = 0; i < N; i++)
    for (int j = 0; j < N; j++)
      dum += tab[j * N + i]; // read along columns
  return dum;
}

void print_avg_timing(int *arg1, int arg2, int (*func)(int *, int), int nb_boot, int nb_call)
{
  int a = 0;
  int b = 0;
  // boot
  for (int i = 0; i < nb_boot; i++)
  {
    a += func(arg1, arg2);
  }

  // measure
  unsigned long int tic, toc;
  unsigned int ui;
  tic = __rdtscp(&ui);
  for (int i = 0; i < nb_call; i++)
  {
    a += func(arg1, arg2);
  }
  toc = __rdtscp(&ui);
  b = a && 7;
  printf("%lu\n", (toc - tic) / (arg2 * nb_call));
}

void access(int *tab, unsigned long int size)
{
  int s;
  for (unsigned long int i = 0; i < size; i++)
  {
    s = i;
  }
}

int main()
{
  int *tab = malloc(1000 * 1000 * sizeof(int));
  for (int i = 0; i < 1000 * 1000; i++)
    tab[i] = rand() % 100000;

  printf("N t (col)\n");
  for (int N = 4070; N <= 4150; N += 2)
  {
    printf("%d ", N);
    print_avg_timing(tab, N, byColumn, 100, 200);
  }
  free(tab);
}
// rm ex4.txt; ./a.out >> ex4.txt; rm ex4a ex4b; split -a 1 -p "N" ex4.txt ex4

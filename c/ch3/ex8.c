#include <stdio.h>
#include <x86intrin.h>
#include <stdlib.h>
#include <time.h>

void randomizeMatrix(int n, int m, int *mat)
{
    for (register int i = 0; i < n; i++)
    {
        for (register int j = 0; j < m; j++)
        {
            register int id = i * n + j;
            mat[id] = rand() % 100;
        }
    }
}
void orderedMatrix(int n, int m, int *mat)
{
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            mat[i * n + j] = i * n + j + 1;
        }
    }
}

void printMatrix(int n, int m, int *mat)
{
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            printf("%2d ", mat[i * n + j]);
        }
        printf("\n");
    }
}

void transpose_naive(int n, int *mat)
{
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < i; j++)
        {
            int tmp = mat[i * n + j];
            mat[i * n + j] = mat[j * n + i];
            mat[j * n + i] = tmp;
        }
    }
}

int min(int a, int b)
{
    return a < b ? a : b;
}

void transpose_better(int n, int *mat)
{
    for (int I = 0; I < n; I += n / 2)
    {
        for (int J = 0; J < n; J += n / 2)
        {
            int i_upper = min(I + n / 2, n);
            int j_upper = min(J + n / 2, n);
            for (int i = I; i < i_upper; i++)
            {
                for (int j = J; j < j_upper; j++)
                {
                    int tmp = mat[i * n + j];
                    mat[i * n + j] = mat[j * n + i];
                    mat[j * n + i] = tmp;
                }
            }
        }
    }
}

void _transpose_rec(int *A, int mAb, int mAe, int nAb, int nAe, int m, int n, int S)
{
    int nblines = mAe - mAb;
    int nbcols = nAe - nAb;

    if ((nblines <= S) && (nbcols <= S))
    {
        int iA, jA;
        for (iA = mAb; iA < mAe; ++iA)
        {
            for (jA = nAb; jA < nAe; ++jA)
            {
                A[jA * m + iA] = A[iA * n + jA];
            }
        }
    }

    else if (nblines > nbcols)
    {
        int mid = nblines / 2;
        _transpose_rec(A, mAb + mid, mAe, nAb, nAe, m, n, S);
        _transpose_rec(A, mAb, mAb + mid, nAb, nAe, m, n, S);
    }
    else
    {
        int mid = nbcols / 2;
        _transpose_rec(A, mAb, mAe, nAb + mid, nAe, m, n, S);
        _transpose_rec(A, mAb, mAb, nAb, nAb + mid, m, n, S);
    }
}

void transpose_rec(int n, int *mat)
{
    _transpose_rec(mat, 0, n, 0, n, n, n, 4);
}

void print_timing(int n, int *mat, void (*func)(int, int *), int nb_boot, int nb_call)
{
    // boot
    for (int i = 0; i < nb_boot; i++)
    {
        func(n, mat);
    }

    // measure
    unsigned long int tic, toc;
    unsigned int ui;
    tic = __rdtscp(&ui);
    for (int i = 0; i < nb_call; i++)
    {
        func(n, mat);
    }
    toc = __rdtscp(&ui);

    printf("%lu\n", (toc - tic) / nb_call);
}

int main()
{
    srand(time(NULL));
    // for (int n = 1024; n <= 65536; n *= 2)
    // {
    //     int *mat = malloc(n * n * sizeof(int));
    //     randomizeMatrix(n, n, mat);
    //     printf("%d ", n);
    //     print_timing(n, mat, transpose_naive, 50, 100);
    //     free(mat);
    // }

    for (int n = 1024; n <= 65536; n *= 2)
    {
        int *mat = malloc(n * n * sizeof(int));
        randomizeMatrix(n, n, mat);
        printf("%d ", n);
        print_timing(n, mat, transpose_better, 50, 100);
        free(mat);
    }

    // for (int n = 1024; n <= 65536; n *= 2)
    // {
    //     int *mat = malloc(n * n * sizeof(int));
    //     randomizeMatrix(n, n, mat);
    //     printf("%d ", n);
    //     print_timing(n, mat, transpose_rec, 100, 1000);
    //     free(mat);
    // }

    return 0;
}
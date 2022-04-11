#include <stdio.h>
#include <sys/mman.h>
#include <x86intrin.h>

#define PAS 1000
#define TAMPON 20000

void empty_cache(unsigned char *tab)
{
    for (int i = 0; i < 256; i++)
    {
        _mm_clflush(tab + TAMPON + i * PAS);
    }
    _mm_mfence();
}

void chrono(unsigned char *tab, int *times, int nb_call)
{
    // measure
    unsigned long int tic, toc;
    unsigned int ui;
    char a = 0;
    int j;
    for (int i = 0; i < 256; i++)
    {
        int j = ((i * 167) + 13) % 0xFF;
        tic = __rdtscp(&ui);
        a += tab[TAMPON + j * PAS];
        toc = __rdtscp(&ui);
        times[j] += (int)(toc - tic);
    }
    empty_cache(tab);
}

// _mm_clflush(p)
// _mm_mfence()

// for (i=0; i<256; i++)
//     j = ((i * 167) + 13) & 0xff;
void print_times(int *times)
{
    printf("   ");
    for (int i = 0; i < 16; i++)
    {
        printf("%3x.", i);
    }
    printf("\n");
    for (int i = 0; i < 16; i++)
    {
        printf("%3x. ", i);
        for (int j = 0; j < 16; j++)
        {
            printf("%3d ", times[i * 15 + j] / 100);
        }
        printf("\n");
    }
}

int main()
{
    unsigned char *tab = malloc(sizeof(unsigned char) * (2 * TAMPON + 256 * PAS));
    for (int i = 0; i < 256; i++)
    {
        mlock(tab + TAMPON + i * PAS, 1);
        munlock(tab + TAMPON + i * PAS, 1);
    }
    int times[256] = {0};

    for (int t = 0; t < 100; t++)
    {
        empty_cache(tab);
        int b = tab[TAMPON + 2 * PAS];
        chrono(tab, times, 100);
    }
    print_times(times);
    return 0;
}
void f(int *A, int *B, int n)
{
    for (int i = 1; i < n - 1; i += 1)
    {
        A[i] = B[i];
        A[i + 1] = B[i + 1];
    }
}
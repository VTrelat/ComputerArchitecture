void sincr(char *t, int n)
{
    for (int i = 0; i < n; i++)
    {
        (*t) += 1;
        ++t;
    }
}
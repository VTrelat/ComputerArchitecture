int sum(int count)
{
    int s = 0;
    int i;
    for (i = 0; i < count; i++)
    {
        s += i * i * i;
    }
    return s;
}

int main()
{
    int a = 0;
    int count = 100000000;
    a += sum(count);
    a += sum(a);
}
unsigned fmul16(unsigned a, unsigned b)
{
    printf("In fmul");
    unsigned long long la=(unsigned long long)a;
    unsigned long long lb=(unsigned long long)b;
    return (la*lb)>>16;
}

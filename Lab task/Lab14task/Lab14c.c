#include<stdio.h>                   //standard input output from header file
extern int say_hi(int x);           //we make say_hi function in hello.asm to compile together

int main(int argc,char *argv[])
{
    int val = 5;
    printf("Hello from C! \n");
    printf("Value passed to Assembly:%d \n",val);
    val = say_hi(val);
    printf("Value returned from Assembly: %d \n",val);
}

//gcc -no-pie Lab14c.c Lab14c.o -o hello
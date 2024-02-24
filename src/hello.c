#include "my_program.h"

char *hello(int n)
{
    char hello_world_base[] = "Hello World!\n";
    int hello_world_base_size = sizeof(hello_world_base);
    char *hello_world = (char*)malloc(hello_world_base_size * n);
    for (int i = 0; i < n; i++) strcat(hello_world, (char*)&hello_world_base);
    return hello_world;
}

void run_hello(int n)
{
    char *ptr = hello(n);
    printf("%s", ptr);
    free(ptr);
}
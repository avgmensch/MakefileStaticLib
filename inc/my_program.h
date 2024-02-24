#ifndef MY_PROGRAM_H
#define MY_PROGRAM_H

#include <stdlib.h> // malloc free
#include <stdio.h> // printf
#include <string.h> // strcat

#include "libfoo.h" // fooadd foomultiply

// ==========================
// src/hello.c
// ==========================

/**
 * Repeats `Hello World!`.
 * @param n How often to repeat.
 * @returns Pointer to the result.
 * @note Don't forget to free the returned pointer.
 */
char *hello(int n);

/**
 * Calls `hello(n)` and prints the result.
 * @param n Param `n` for `hello`.
 * @note The pointer from `hello` is freed at the end of the function.
 */
void run_hello(int n);

#endif
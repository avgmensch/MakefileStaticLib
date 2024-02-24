#ifndef LIBFOO_H
#define LIBFOO_H

// https://www.gnu.org/software/c-intro-and-ref/manual/html_node/Variable-Number-of-Arguments.html

#include <stdio.h> // printf
#include <stdarg.h> // va_list va_start

/**
 * Add numbers in `...` and print the operation.
 * @param argc Number of arguments in `...`.
 * @param ... Number to add together.
 * @returns Sum of `...`.
 */
int fooadd(int argc, ...);

/**
 * Multiply numbers in `...` and print the operation.
 * @param argc Number of arguments in `...`.
 * @param ... Number to multiply.
 * @returns Product of `...`.
 */
int foomultiply(int argc, ...);

#endif
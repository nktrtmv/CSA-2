#ifndef FUNCS_H
#define FUNCS_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <math.h>

int getRandomNumber(long start, long end);

double getNumber(int argc, char* argv[]);

void outputNumber(double total, int argc, char* argv[]);

double factorial(double num);

#endif /*FUNCS_H*/
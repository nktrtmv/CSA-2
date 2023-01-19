#include <stdlib.h>

int getRandomNumber(int start, int end) {
    return rand() % (end + 1 - start) + start;
}
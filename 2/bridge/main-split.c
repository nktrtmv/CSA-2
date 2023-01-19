#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <ctype.h>
#include "funcs.h"

// variant 29

int main(int argc, char* argv[]) {
    srand(time(NULL));
    if (argc < 2 || argc > 4) {
        printf("%s\n",
               "Вы обязаны ввести 1,2 или 3 аргумента командной строки:\n"
               "Первый - -f/-r/-c.\n"
               "Второй и третий опциональны, "
               "это абсолютный путь к файлам ввода и вывода.");
        return 0;
    }
    FILE* file = NULL;
    if (!strcmp(argv[1], "-f")) {
        if (argc > 2) {
            file = fopen(argv[2], "r");
        } else {
            file = fopen("string_in.txt", "r");
        }
        if (file == NULL) {
            printf("%s\n",
                   "Ошибка! Файл ввода не может быть открыт.\n"
                   "Файл должен существовать и быть формата txt.");
            return 0;
        }
    }
    int n = 0;
    char* string = malloc(65536);

    if (!strcmp(argv[1], "-r")) {
        n = getRandomNumber(1, 10000);
        for (int i = 0; i < n; i++) {
            if (getRandomNumber(0, 16) > 13) {
                string[i] = ' ';
            } else {
                string[i] = getRandomNumber(97, 122);
            }
        }
    } else if (!strcmp(argv[1], "-f")) {
        int ch;
        do {
            ch = tolower(fgetc(file));
            string[n++] = ch;
        } while (ch != -1);
        string[n - 1] = '\0';
    } else {
        int ch;
        do {
            ch = tolower(fgetc(stdin));
            string[n++] = ch;
        } while (ch != -1);
        string[n - 1] = '\0';
    }

    unsigned int start_time = clock();
    char* total = malloc(n);
    int len = 0;
    int start, end = -1;
    for (int i = 0; i < n; i++) {
        int temp = i;
        if (string[i] > 96 && string[i] < 123) {
            if (end + 1 == i) {
                start = i;
            }
            if (i < n - 1) {
                continue;
            }
            temp++;
        }
        end = temp;
        int isPal = 1;
        int k = end - start;
        for (int j = 0; j < k / 2; j++) {
            if (string[start + j] != string[end - j - 1]) {
                isPal = 0;
                break;
            }
        }
        if (isPal == 1) {
            for (int j = start; j < end; j++) {
                total[len++] = string[j];
            }
            total[len++] = ' ';
        }
    }
    total[len] = '\0';

    unsigned int end_time = clock();
    printf("%s", "Время выполнения программы: ");
    printf("%d", end_time - start_time);
    printf("%s\n", "мс");

    if (!strcmp(argv[1], "-f")) {
        fclose(file);
        file = NULL;
    }
    if (strcmp(argv[1], "-c")) {
        if (argc == 4) {
            file = fopen(argv[3], "w");
        } else {
            file = fopen("string_out.txt", "w");
        }
    }

    if (!strcmp(argv[1], "-c")) {
        puts(total);
    } else {
        fputs(total, file);
    }

    if (strcmp(argv[1], "-c")) {
        fclose(file);
    }

    if (total != NULL) {
        free(total);
    }

    if (string != NULL) {
        free(string);
    }
    return 0;
}
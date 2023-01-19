#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <math.h>

int getRandomNumber(long start, long end) {
    return rand() % (end + 1 - start) + start;
}

double getNumber(int argc, char* argv[]) {
    FILE* file = NULL;
    if (!strcmp(argv[1], "-f")) {
        if (argc > 2) {
            file = fopen(argv[2], "r");
        } else {
            file = fopen("in.txt", "r");
        }
        if (file == NULL) {
            printf("%s\n",
                   "Ошибка! Файл ввода не может быть открыт.\n"
                   "Файл должен существовать и быть формата txt.");
            exit(1);
        }
    }

    double number = 0;

    if (!strcmp(argv[1], "-r")) {
        number = (double)getRandomNumber(-78, 53);
    } else if (!strcmp(argv[1], "-f")) {
        fscanf(file, "%lf\n", &number);
    } else {
        scanf("%lf", &number);
    }

    if (!strcmp(argv[1], "-f")) {
        fclose(file);
        file = NULL;
    }

    return number;
}

void outputNumber(double total, int argc, char* argv[]) {
    FILE* file = NULL;
    if (strcmp(argv[1], "-c")) {
        if (argc == 4) {
            file = fopen(argv[3], "w");
        } else {
            file = fopen("out.txt", "w");
        }
    }

    if (!strcmp(argv[1], "-c")) {
        printf("%.23lf\n", total);
    } else {
        fprintf(file, "%.23lf\n", total);
    }

    if (strcmp(argv[1], "-c")) {
        fclose(file);
    }
}

double factorial(double num) {
    double res = 1;
    for (double i = 1; i <= num; i++) {
        res *= i;
    }
    return res;
}

int main(int argc, char* argv[]) {
    srand(time(NULL));
    if (argc < 2 || argc > 4) {
        printf("%s\n",
               "Вы обязаны ввести 1,2 или 3 аргумента командной строки:\n"
               "Первый - -f/-r/-c.\n"
               "Второй и третий опциональны, "
               "это абсолютный путь к файлам ввода и вывода.");
        return 1;
    }

    unsigned int start_time = clock();

    double input = getNumber(argc, argv);
    double x = fabs(input);

    double total = 1, total_temp = 0, n = 1;

    while (total - total_temp > 0.000005) {
        total_temp = total;
        total += pow(x, n) / factorial(n);
        n++;
    }

    unsigned int end_time = clock();

    printf("%s", "Время выполнения программы: ");
    printf("%.5lf", (double) (end_time - start_time) / CLOCKS_PER_SEC);
    printf("%s\n", "с");

    outputNumber(input < 0 ? total : 1 / total, argc, argv);
    return 0;
}
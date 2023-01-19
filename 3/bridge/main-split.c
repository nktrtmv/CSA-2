#include "funcs.h"

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
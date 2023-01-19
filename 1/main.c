#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

int main(int argc, char *argv[]) {
    FILE *file = NULL;
    if (!strcmp(argv[1], "-f")) {
        if (argc > 3){
            file = fopen(argv[3], "r");
        } else {
            file = fopen("array_in.txt", "r");
        }
    }
    int n = atoi(argv[2]);
    int* a = (int*)malloc(sizeof(int)*n);
    
    for (int i = 0; i < n; i++) {
        if (!strcmp(argv[1], "-r")) {
            a[i] = rand() % 2 * (-1000) + rand() % 1000;
        } else if (!strcmp(argv[1], "-f")) {
            fscanf(file, "%d", &a[i]);
        } else {
            scanf("%d", &a[i]);
        }
    }
    
    int k = 0;
    for (int i = 1; i < n - 1; i++) {
        if (a[i] != a[0] && a[i] != a[n - 1]) {
            k++;
        }
    }
    
    int* b = (int*)malloc(sizeof(int)*k);;
    k = 0;
    for (int i = 1; i < n - 1; i++) {
        if (a[i] != a[0] && a[i] != a[n - 1]) {
            b[k] = a[i];
            k++;
        }
    }

    if (!strcmp(argv[1], "-f")) {
        fclose(file);
        file = NULL;
    }
    if (strcmp(argv[1], "-c")) {
        if (argc == 5){
            file = fopen(argv[4], "w");
        } else {
            file = fopen("array_out.txt", "w");
        }
        
    }
    
    for (int i = 0; i < k; i++) {
        if (!strcmp(argv[1], "-c")){
            printf("%d\t", b[i]);
        } else {
            fprintf(file, "%d\t", b[i]);
        }
    }
    
    if (strcmp(argv[1], "-c")) {
        fclose(file);
    }
    free(b);
    free(a);
    return 0;
}
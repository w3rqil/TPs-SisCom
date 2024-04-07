#include <stdio.h>
#include <stdlib.h>

int convert_and_increment(float gini_index);

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Uso: %s <indice_gini>\n", argv[0]);
        return 1;
    }

    float indice_gini = atof(argv[1]);
    int resultado = convert_and_increment(indice_gini);
    printf("%d\n", resultado);
    return 0;
}

int convert_and_increment(float gini_index) {
    int result = (int)gini_index;  // Convertir float a int
    return result + 1;  // Incrementar en uno
}
#include <stdio.h>
#include <stdlib.h>

extern int gini_manipulation_asm(float gini_index);

int convert_and_increment(float gini_index) 
{
    /* Call the assembly function */
    return gini_manipulation_asm(gini_index);
}

// ------------ C Code ---------------
// int convert_and_increment(float gini_index) {
//     int result = (int)gini_index;  // Convertir float a int
//     return result + 1;  // Incrementar en uno
// }
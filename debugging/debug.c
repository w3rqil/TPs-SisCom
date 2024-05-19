#include <stdio.h>
/* due to problems using the GUI while debugging, we've decided to do this .c file*/
extern int gini_manipulation_asm(float gini_index);

int main() 
{
    float gini_index = 43.3;
    int result;

    /* Call the assembly function */
    result = gini_manipulation_asm(gini_index);

    printf("%f -> %d\n", gini_index, result);

    return 0;
}
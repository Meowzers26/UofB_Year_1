/* Find the area of paint needed */


#include <stdio.h>

int area(int length, int width, int height) {

    int sides = 2 * length * height;                            // can be declared without being initialized, but good practice to initialize at declaration
    int ends = 2 * width * height;
    int ceiling = length * width;

    return sides + ends + ceiling;
}

int main(void) {

    int length, width, height;
    scanf("%d", &length);                                       // ⚠️NEVER USE scanf⚠️, btw remember the ampersand

    printf("The paint area is: %d\n", total);                   // %d or %i = conversion specification -> print integer in decimal format from extra argument
                                                                // printf function with many %d's are called variadic
    return 0;
}

// if global variables are used, most local variable will overwrtie
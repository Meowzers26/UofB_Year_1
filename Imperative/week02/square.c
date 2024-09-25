/* a squaring function */ 
#include <stdio.h> 

// squares the integer
int square(int n) {
  return (n * n);
}

// returns square
int main(void) { 
  int n;

  printf("Enter integer to be squared: ");
  scanf("%d", &n);

  printf("%d squared is %d\n", n, square(n));

  return 0; 
}

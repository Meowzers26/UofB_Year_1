/* Find the lowest limit of the int type */
#include <stdio.h>

int smallestInt(int lower, long upper) {
	long current = lower + ((upper - lower) / 2);
	int test = current;


	if (test == current) {
		upper = current;
	}

	else {
		lower = current;
	}


	if (upper - lower <= 1) {
		return current;
	}

	return smallestInt(lower, upper);
}

int main(void) {
  int n = smallestInt(-500000000000, 0);
  printf("The smallest int is %d\n", n);

  return 0;
}

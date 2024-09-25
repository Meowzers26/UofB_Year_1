/* Find the upper limit of the int type */
#include <stdio.h>

int largestInt(int lower, long upper) {
	long current = lower + ((upper - lower) / 2);
	int test = current;


	if (test == current) {
		lower = current;
	}

	else {
		upper = current;
	}


	if (upper - lower <= 1) {
		return current;
	}

	return largestInt(lower, upper);
}

int main(void) {
  int n = largestInt(0, 500000000000);
  printf("The largest int is %d\n", n);

  return 0;
}

/* Calculates interest */
#include <stdio.h>

double add(double amount, double rate) {
  double interest = amount * rate * 0.01;
  double total = amount + interest;

  return total;
}

int main(void) {
  double amount, rate;
  printf("The amount of money you're starting with is: £");
	scanf("%lf", &amount);
	printf("\nThe interest rate (percentage) is: ");
	scanf("%lf", &rate);

  double total = add(amount, rate);

  printf("Adding %.2lf%% interest to £%.2lf gives £%.2lf\n", rate, amount, total);
  return 0;
}

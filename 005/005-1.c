#include <stdio.h>

int greatest_common_divisor(int, int);

int main() {
  const int LOWER_LIMIT = 1;
  const int UPPER_LIMIT = 20;

  int answer = 1, i, n, m, divisor;

  for (i = LOWER_LIMIT; i <= UPPER_LIMIT; i++) {
    n = answer;
    m = i;

    while ((divisor = greatest_common_divisor(n, m)) != 1) {
      n /= divisor;
      m /= divisor;
    }
    answer *= m;
  }

  printf("smallest = %d", answer);

  return 0;
}

int greatest_common_divisor(int a, int b) {
  int c;

  while ((c = a % b) != 0) {
    a = b;
    b = c;
  }

  return b;

}

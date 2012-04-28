#include <stdio.h>

int is_prime(int);

int main() {
  const int LIMIT = 10001;
  int i = 1, j = 2, result;

  do {
    if (is_prime(j)) {
      result = j;
      i++;
    }
    j++;
  } while (i <= LIMIT);

  printf("%d prime is %d", LIMIT, result);

  return 0;
}

int is_prime(int num) {
  int check;

  if (num < 2) return 0;

  for (check = 2; check < num; check++) {
    if (num % check == 0) {
      return 0;
    }
  }

  return 1;
}

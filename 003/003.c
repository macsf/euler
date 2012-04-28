#include <stdio.h>

int is_prime(long long);

int main() {
  // find prime

  long long i,
    limit = 600851475143,
    test = 100000;

  int done = 0;

  for (i = 0; i <= test; i++) {
    if (limit == 1) return 0;
    if (is_prime(i)) {
      if (limit % i == 0) {
        printf("%lld / %lld\t= %lld\n", limit, i, limit / i);
        limit /= i;
      }
    }
  }

  return 0;
}

int is_prime(long long num) {
  long long check;

  if (num < 2) return 0;

  for (check = 2; check < num; check++) {
    if (num % check == 0) {
      return 0;
    }
  }

  return 1;
}

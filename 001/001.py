# 234168
#
#real   0m0.038s
#user   0m0.024s
#sys    0m0.012s

LIMIT = 1000
sum = 0

for n in range(1, LIMIT + 1):
    if n % 3 == 0 or n % 5 == 0:
        sum = sum + n

print sum

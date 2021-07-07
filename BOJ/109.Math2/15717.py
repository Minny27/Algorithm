# 떡파이어
# 구현 아이디어 : 2의 거듭 제곱 연산을 이용한 분할 정복
# ((a % m) * (b % m)) % m = (a * b) % m 나머지의 성질을 이용
# ex) 100 -> 2 ** 99 % (10 ** 9 + 7) == 2 ** 64 % (10 ** 9 + 7) * 2 ** 32 % (10 ** 9 + 7) * 2 ** 2 % (10 ** 9 + 7) * 2 ** 1 % (10 ** 9 + 7)

import sys
input = sys.stdin.readline
n = float(input())

def solution(a, b, mod):
    sum = 1
    while b:
        if b % 2:
            sum = sum * a % mod
        a = a * a % mod
        b //= 2
    return sum
if n == 0: 
    print(1)
else: 
    print(solution(2, n - 1, 10 ** 9 + 7))

# 359738130 -> 2 ** 35 % (10 ** 9 + 7)
# 582344008 -> 2 ** 64 % (10 ** 9 + 7)
# 988185646 -> 2 ** 35 * 2 ** 64 % (10 ** 9 + 7) = 2 * 99 % (10 ** 9 + 7)
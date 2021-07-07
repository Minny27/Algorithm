# 이항 계수 3
# 구현 아이디어 : nCk = n! / (n - k)! * k! 구하기
# 안 된다...

import math
import sys
sys.setrecursionlimit(4000000)

n, k = map(int, input().split())
dp = [0] +  [1] * n

if k > n / 2:
    k = n - k

def fact(num):
    if num == 1:
        return 1
    else:
        dp[num] = num * fact(num - 1)
        return num * fact(num - 1)

fact(n)
print(float(dp[n] / (dp[n-k] * dp[k]) / 1000000007) * 100 / 100)
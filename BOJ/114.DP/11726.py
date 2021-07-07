# -*- coding: utf-8 -*-

# 2×n 타일링
# 시간 : 25분
# 구현 아이디어 : 피보나치
import sys
input = sys.stdin.readline
n = int(input())
dp = [0] * (n + 1)

def solution():
    dp[0], dp[1] = 1, 2
    for i in range(2, n):
        dp[i] = (dp[i - 1] + dp[i - 2]) % 10007
    print(dp[n - 1])
solution()
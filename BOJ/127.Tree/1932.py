# -*- coding: utf-8 -*-

# 정수 삼각형
# 시간 : 40분
# 구현 알고리즘 : dp -> 깊이(i), 갱신할 깊이의 값(dp[i + 1][k]), 현재 깊이에서의 값(dp[i][j])
# 한 층씩 증가하면서 현재 층의 값(dp[i][j])을 기준으로 다음 층의 연결된 값(dp[i + 1][k])를 현재 값와 dp[i][j] + g[i + 1][k]을 비교해서 max값 갱신
# dp 어렵다...
import sys
input = sys.stdin.readline
n = int(input())
g = []
dp = [[0 for _ in range(n)] for _ in range(n)]
for i in range(n):
    arr = list(map(int, input().split()))
    g.append(arr)
dp[0][0] = g[0][0]
for i in range(n - 1):
    for j in range(len(g[i])):
        for k in range(j, j + 2):
            dp[i + 1][k] = max(dp[i + 1][k], dp[i][j] + g[i + 1][k])
print(max(dp[n - 1]))
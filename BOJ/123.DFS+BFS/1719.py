# 택배
# 구현 아이디어 : i -> j 로가는 경우, dp[i][j]에 경유지였던 dp[i][k] 값을 넣기

import sys
input = sys.stdin.readline
n, m = map(int, input().split())
g = [[sys.maxsize for _ in range(n)] for _ in range(n)]
dp = [['-' for _ in range(n)] for _ in range(n)]
for k in range(m):
    i, j, w = map(int, input().split())
    g[i - 1][j - 1] = w
    g[j - 1][i - 1] = w
    dp[i - 1][j - 1] = j
    dp[j - 1][i - 1] = i

def solution():
    for k in range(n):
        for i in range(n):
            for j in range(n):
                if i != j and g[i][j] > g[i][k] + g[k][j]:
                    g[i][j] = g[i][k] + g[k][j]
                    dp[i][j] = dp[i][k]
    for s in range(n):
        for e in range(n):
            print(dp[s][e], end = ' ')
        print()
solution()

# Test Case
# 3 1
# 2 3 2
# 플로이드
# 시간 : 25분

import sys
input = sys.stdin.readline
n = int(input())
m = int(input())
g = [[sys.maxsize for _ in range(n)] for _ in range(n)]
for k in range(m):
    i, j, c = map(int, input().split())
    g[i - 1][j - 1] = min(g[i - 1][j - 1], c)
def solution():
    for k in range(n):
        for i in range(n):
            for j in range(n):
                if g[i][j] > g[i][k] + g[k][j]:
                    g[i][j] = g[i][k] + g[k][j]
    for s in range(n):
        for e in range(n):
            if s == e or g[s][e] == sys.maxsize:
                print(0, end = ' ')
            else:
                print(g[s][e], end = ' ')
        print()
solution()

# Test Case
# 3
# 1
# 2 3 1
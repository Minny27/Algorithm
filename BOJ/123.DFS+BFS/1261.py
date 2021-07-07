# 알고스팟

import sys
from collections import deque
input = sys.stdin.readline
m, n = map(int, input().split())
g = [list(map(int, list(input().strip()))) for _ in range(n)]
dp = [[sys.maxsize for i in range(m)] for _ in range(n)]
di = [1, -1, 0, 0]
dj = [0, 0, 1, -1]

def boundary(i, j):
    return 0 <= i < n and 0 <= j < m

def bfs(i, j):
    q = deque()
    q.append([i, j])
    dp[0][0] = 0
    while q:
        i, j = q.popleft()
        # if i == n - 1 and j == m - 1:
        #     print(dp[n - 1][m - 1])
        #     return
        for l in range(4):
            ii = i + di[l]
            jj = j + dj[l]
            if boundary(ii, jj):
                if g[ii][jj] == 0:
                    if dp[ii][jj] > dp[i][j]:
                        dp[ii][jj] = dp[i][j]
                        q.append([ii, jj])
                else:
                    if dp[ii][jj] > dp[i][j] + 1:   
                        dp[ii][jj] = dp[i][j] + 1
                        q.append([ii, jj])
    print(dp[n - 1][m - 1])
bfs(0, 0)
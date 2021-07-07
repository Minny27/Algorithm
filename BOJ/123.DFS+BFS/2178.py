# 미로 탐색

import sys, copy
input = sys.stdin.readline

n, m = map(int, input().split()) # i j
g = list()
for i in range(n):
    g.append(list(map(str, input().strip())))
di = [1, -1, 0, 0]
dj = [0, 0, 1, -1]

def bfs(i, j):
    visited = [[1 for _ in range(m)] for _ in range(n)]
    dp = [[(n * m + 1) for j in range(m)] for i in range(n)]
    dp[0][0] = int(g[0][0])
    q = [[i, j]]
    while len(q) > 0:
        s = q[0]
        q.remove(s)
        for k in range(4):
            tmpi = int(s[0])
            tmpj = int(s[1])
            ii = di[k] + tmpi
            jj = dj[k] + tmpj
            if 0 <= ii < n and 0 <= jj < m and visited[ii][jj]:
                visited[ii][jj] = 0
                if g[ii][jj] == '1':
                    q.append([ii, jj])
                    dp[ii][jj] = min(dp[ii][jj], int(g[ii][jj]) + dp[tmpi][tmpj])
    return dp[n - 1][m - 1]
print(bfs(0, 0))

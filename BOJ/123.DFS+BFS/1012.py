# 유기농 배추

def bfs(i, j):
    q = [[i, j]]
    while len(q) > 0:
        s = q[0]
        q.remove(s)
        for l in range(4):
            ii = di[l] + s[0]
            jj = dj[l] + s[1]
            if 0 <= ii < n and 0 <= jj < m:
                if visited[ii][jj]:
                    visited[ii][jj] = 0
                    if g[ii][jj] == 1:
                        q.append([ii, jj])
    return 1

import sys
input = sys.stdin.readline
n = int(input())
di = [1, -1, 0, 0]
dj = [0, 0, 1, -1]
ans = [0] * n

for z in range(n):
    m, n, k = map(int, input().split()) # 가로, 세로, 배추 개수
    visited = [[1 for _ in range(m)] for _ in range(n)]
    g = [[0 for _ in range(m)] for _ in range(n)]
    for _ in range(k):
        tmp = list(map(int, input().split()))
        g[tmp[1]][tmp[0]] = 1
    for i in range(n):
        for j in range(m):
            if visited[i][j] and g[i][j] != 0:
                ans[z] += bfs(i, j)
print("\n".join(map(str, ans)))

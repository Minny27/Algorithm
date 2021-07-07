# Best Grass
# 시간 : 38분

import sys
from collections import deque
input = sys.stdin.readline
n, m = map(int, input().split())
g = [list(input().rstrip()) for i in range(n)]
visited = [[0 for _ in range(m)] for _ in range(n)]
di = [1, -1, 0, 0]
dj = [0, 0, 1, -1]
ans = 0

def bfs(i, j):
    q = deque()
    visited[i][j] = 1
    q.append([i, j])
    while q:
        i, j = q.popleft()
        for k in range(4):
            ii = i + di[k]
            jj = j + dj[k]
            if 0 <= ii < n and 0 <= jj < m and not visited[ii][jj] and g[ii][jj] == '#':
                visited[ii][jj] = 1
                q.append([ii, jj])
    return 1

def dfs(i, j):
    if g[i][j] == '.':
        return
    visited[i][j] = 1
    for k in range(4):
        ii = i + di[k]
        jj = j + dj[k]
        if 0 <= ii < n and 0 <= jj < m and not visited[ii][jj] and g[ii][jj] == '#':
            dfs(i + di[k], j + dj[k])
    return 1

for i in range(n):
    for j in range(m):
        if not visited[i][j] and g[i][j] == '#':
            ans += bfs(i, j)
print(ans)
        
# if __name__ == '__main__':
#     solution()


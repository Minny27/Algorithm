#토마토 1
# 항상 어떤 알고리즘을 짤 때 시간복잡도가 어느정도 될 것이라는 것을 예측하면 짜기!

import sys, copy
from collections import deque
input = sys.stdin.readline
m, n = map(int, input().split()) # j i
g = list()
q = deque()
visited = [[1 for _ in range(m)] for _ in range(n)]
cnt = [0]
for i in range(n):
    line = list(map(int, input().split()))
    for j in range(m):
        if line[j] == 1:
            q.append([i, j])
        elif line[j] == 0:
            cnt[0] += 1
    g.append(line)
di = [1, -1, 0, 0]
dj = [0, 0, 1, -1]
dp = copy.copy(g)

def bfs():
    maxValue = -1
    while q and cnt[0]:
        s = q.popleft()
        for k in range(4):
            ii = di[k] + s[0]
            jj = dj[k] + s[1]
            if 0 <= ii < n and 0 <= jj < m and visited[ii][jj]:
                visited[ii][jj] = 0
                if g[ii][jj] == 1 or g[ii][jj] == -1:
                    continue
                elif g[ii][jj] == 0:
                    q.append([ii, jj])
                    dp[ii][jj] = dp[s[0]][s[1]] + 1
                    maxValue = max(maxValue, dp[ii][jj])
                    cnt[0] -= 1
                else:
                    q.append([ii, jj])
                    dp[ii][jj] = min(dp[ii][jj], dp[s[0]][s[1]] + 1)        
                    maxValue = max(maxValue, dp[ii][jj])
    return maxValue

def solution():
    ans = bfs()
    if cnt[0]:
        print(-1)
    elif ans == -1:
        print(0)
    else:
        print(ans - 1) 
solution()
# -*- coding: utf-8 -*-

# 미로만들기
# 시간 : 1시간 50분
# 구현 아이디어 : bfs
# 벽부수고 이동하기랑 비슷해서 그렇게 풀려고 했는데 벽을 부수는 제한이 없다 보니까 풀이하는데 시간이 걸림...
# 힙 정렬을 이용하면 될 것이라고 생각을 못 함...
# 1) visited[i][j][0] -> 방문, visited[i][j][1] -> 벽을 몇 번 뚫었는지 저장
# 2) g[i][j] == 1 떄는 q.appendleft([ii, jj]), 0은 q.append([ii, jj]) -> 1일 때를 먼저 방문

import sys
from collections import deque
input = sys.stdin.readline
n = int(input())
g = [list(map(int, list(map(int, input().strip())))) for _ in range(n)]
di = [1, -1, 0, 0]
dj = [0, 0, 1, -1]

def boundary(i, j):
    return 0 <= i < n and 0 <= j < n

def bfs():
    q = deque()
    visited = [[[0] * 2 for _ in range(n)] for _ in range(n)]
    q.append([0, 0])
    visited[0][0][0] = 1  
    while q:
        i, j = q.popleft()
        for k in range(4):
            ii = i + di[k]
            jj = j + dj[k]
            if boundary(ii, jj):        
                if not visited[ii][jj][0]:
                    visited[ii][jj][0] = 1
                    if g[ii][jj] == 1:
                        visited[ii][jj][1] = visited[i][j][1]
                        q.appendleft([ii, jj])
                    else:
                        visited[ii][jj][1] = visited[i][j][1] + 1
                        q.append([ii, jj])
    print(visited[n - 1][n - 1][1])
    return
bfs()

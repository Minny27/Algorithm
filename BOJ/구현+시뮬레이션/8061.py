# -*- coding: utf-8 -*-

# Bitmap
# 구현 아이디어 : bfs
# 1) 그래프에 1인 좌표를 모두 큐에 넣기
# 2) 1인 곳을 0으로 바꾸기, 1인 모든 좌표(i, j)를 방문 체크
# 3) bfs로 1의 주변(상, 하, 좌, 우)는 0이면 1로 바꾸기
# 4) arr[ii][jj] = arr[i][j] + 1 로 값을 늘려주기, ii, jj 좌표 방문 체크

import sys
from collections import deque
input = sys.stdin.readline
n, m = map(int, input().split())
arr = [list(map(int, list(map(int, input().strip())))) for _ in range(n)]
q = deque()
visited = [[0 for _ in range(m)] for _ in range(n)]
di = [1, -1, 0, 0]
dj = [0, 0, 1, -1]

def boundary(i, j):
    return 0 <= i < n and 0 <= j < m

def bfs():
    while q:
        i, j = q.popleft()
        for k in range(4):
            ii = i + di[k]
            jj = j + dj[k]
            if boundary(ii, jj) and not visited[ii][jj]:
                visited[ii][jj] = 1
                if arr[i][j] == 0:
                    arr[ii][jj] = 1
                else:
                    arr[ii][jj] = arr[i][j] + 1
                q.append([ii, jj])
for i in range(n):
    for j in range(m):
        if arr[i][j] == 1:
            arr[i][j] = 0
            visited[i][j] = 1
            q.append([i, j])
bfs()
for i in range(n):
    print(" ".join(map(str, arr[i])))

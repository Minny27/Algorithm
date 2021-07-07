# 영역 구하기
# 시간 : 1시간
# 구현 아이디어 : 맵(g)을 만들고 기본은 0, 직사각형 영역은 1, bfs로 count할 때는 2
# 배운 점 : 여태까지는 (0, 0)이 맨 왼쪽 위라고 가정하고 문제를 풀어서 그 틀에 맞추려고 했는데
# 맨 왼쪽 아래부터 시작하니까 상하 대칭이 된다는 것
# sort 보다 sorted가 더 빠르고 간결하다?

import sys
from collections import deque
input = sys.stdin.readline
n, m, k = map(int, input().split())
g = [[0 for _ in range(m)] for _ in range(n)]
di = [1, -1, 0, 0]
dj = [0, 0, 1, -1]
ans = []

def bfs(i, j):
    q = deque()
    q.append([i, j])
    g[i][j] = 2
    cnt = 0
    while q:
        i, j = q.popleft()
        cnt += 1
        for k in range(4):
            ii = i + di[k]
            jj = j + dj[k]
            if 0 <= ii < n and 0 <= jj < m and not g[ii][jj]:
                g[ii][jj] = 2
                q.append([ii, jj])
    ans.append(cnt)

def solution():
    for _ in range(k):
        x1, y1, x2, y2 = map(int, input().split())
        # ys = n - y2
        # ye = n - y2 + y2 - y1
        # for i in range(ys, ye):
        #     for j in range(x1, x2):
        #         g[i][j] = 1
        # for i in range(x1, x2):
        #     for j in range(y1, y2):
        #         g[j][i] = 1
        for i in range(y1, y2):
            for j in range(x1, x2):
                g[i][j] = 1
    for i in range(n):
        for j in range(m):
            if not g[i][j]:
                bfs(i, j)
    # ans.sort()
    print(len(ans))
    print(" ".join(map(str, sorted(ans))))
solution()
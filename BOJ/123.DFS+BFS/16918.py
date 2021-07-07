# -*- coding: utf-8 -*-

# 봄버맨
# 구현 아이디어 : bfs + 3개의 그래프
# 세 개의 그래프 (1초, 4n - 1초, 그 외) 세 개만 나오는 걸로 생각해서 했는데 반례를 찾아버렸음..

import sys
from collections import deque
input = sys.stdin.readline
r, c, n = map(int, input().split())
g1 = [list(input().strip()) for _ in range(r)]
g2 = [['O' for _ in range(c)] for _ in range(r)]
g3 = [['O' for _ in range(c)] for _ in range(r)]
q = deque()
di = [1, -1, 0, 0]
dj = [0, 0, 1, -1]

def boundary(i, j):
    return 0 <= i < r and 0 <= j < c

def bfs():
    while q:
        i, j = q.popleft()
        g3[i][j] = '.'
        for k in range(4):
            ii = i + di[k]
            jj = j + dj[k]
            if boundary(ii, jj):
                g3[ii][jj] = '.'

for i in range(r):
    for j in range(c):
        if g1[i][j] == 'O':
            q.append([i, j])
bfs()
if n == 1:
    for i in range(r):
        print("".join(g1[i]))
elif (n + 1) % 4 == 0:
    for i in range(r):
        print("".join(g3[i]))
else:
    for i in range(r):
        print("".join(g2[i]))

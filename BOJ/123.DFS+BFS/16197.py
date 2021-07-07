# -*- coding: utf-8 -*-

# 두 동전
import sys
from collections import deque
input = sys.stdin.readline
n, m = map(int, input().split())
g = [list(map(str, input().strip())) for _ in range(n)]
print(g)
q = deque()
d = [[-1, 0], [1, 0], [0, -1], [0, 1]]

def boundary(i, j):
    return 0 <= i < n and 0 <= j < m

def bfs():

for i in range(n):
    for j in range(m):
        if g[i][j] == 'o':
            q.append([i, j])

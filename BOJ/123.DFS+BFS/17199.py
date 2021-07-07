# -*- coding: utf-8 -*-

# Milk Factory
import sys
from collections import deque
input = sys.stdin.readline
n = int(input())
g = [[] for _ in range(n + 1)]
ans = []
for i in range(n - 1):
    n1, n2 = map(int, input().split())
    g[n2].append(n1)

def bfs(i):
    global ans
    q = deque()
    visited = [0] * (n + 1)
    cnt = 0
    q.append(i)
    visited[i] = 1
    while q:
        s = q.popleft()
        for adj in g[s]:
            if not visited[adj]:
                visited[adj] = 1
                cnt += 1
                q.append(adj)
        if cnt == n - 1:
            ans.append(i)
for i in range(1, n + 1):
    bfs(i)
ans.sort()
if ans == []:
    print(-1)
else:
    print(ans[0])
# -*- coding: utf-8 -*-

# 트리의 부모 찾기
# 시간 : 1시간
# 구현 아이디어 : union-find로 풀 수 있을 줄 알았지만,,, bfs로 간단하게 풀 수 있는 문제였다..
import sys
from collections import deque
input = sys.stdin.readline
n = int(input())
g = [[] for _ in range(n + 1)]
ans = [0] * (n + 1)
for i in range(n - 1):
    a, b = (map(int, input().split()))
    g[a].append(b)
    g[b].append(a)

def bfs(i):
    q = deque()
    q.append(i)
    while q:
        parent = q.popleft()
        for adj in g[parent]:
            if not ans[adj]:
                ans[adj] = parent
                q.append(adj)
bfs(1)
for i in range(2, n + 1):
    print(ans[i])
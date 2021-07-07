# -*- coding: utf-8 -*-

# 연결 요소의 개수
# 시간 : 22분
# 구현 아이디어 : bfs -> 이유는 dfs는 root 노드에서 시작하면 한 번에 갈 수 있지만
# 그렇지 않은 경우 모든 노드를 다 방문해야함, but bfs는 큐에 연결된 모든 자식 노드를 저장하기 때문에 모든 노드 방문 용이하다고 생각함

import sys
from collections import deque
input = sys.stdin.readline
vN, eN = map(int, input().split())
g = [[] for _ in range(vN + 1)]
visited = [0 for _ in range(vN + 1)]
ans = 0
for i in range(eN):
    n1, n2 = map(int, input().split())
    g[n1].append(n2)
    g[n2].append(n1)

def bfs(i):
    q = deque()
    q.append(i)
    visited[i] = 1
    while q:
        s = q.popleft()
        for adj in g[s]:
            if not visited[adj]:
                visited[adj] = 1
                q.append(adj)
    return 1

for i in range(1, vN + 1):
    if not visited[i]:
        ans += bfs(i)
print(ans)

# Test Case
# 3 0
# 답: 3
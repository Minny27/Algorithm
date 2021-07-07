# -*- coding: utf-8 -*-

# MooTube (Silver)
# 시간 : 3시간
# 구현 아이디어 : 처음에는 플로이드 와샬처럼 표를 만들어서 모든 노드의 최소 비용 거리를 구하려고 했지만
# 질문의 개수(qN)이 10억이기 때문에 시간초과가 발생할 것으로 생각
# 다시 생각해보니까 k보다 크거나 같은 가중치를 가진 노드들만 체크해서 count하면 된다고 생각
# 1) 노드의 [가중치, 인접노드] 형태로 그래프 생성
# 2) qestion도 [k, v] 형태로 저장
# 3) dijkstra 함수에 qestion에 있는 값을 입력값으로 받기
# 4) 유사도(가중치)가 k보다 크거나 같은 노드들만 큐에 저장, cnt를 1증가
# 5) 모든 노드를 다 방문하면 cnt를 ans에 저장

import sys
from collections import deque
input = sys.stdin.readline
vN, qN  = map(int, input().split()) # 노드 개수, 질문 개수
g = [[] for _ in range(vN + 1)] # 그래프
qestion = [] # 질문
ans = [] # 정답
for i in range(vN - 1):
    n1, n2, w = map(int, input().split())
    g[n1].append([w, n2])
    g[n2].append([w, n1])
for i in range(qN):
    k, v = map(int, input().split())
    qestion.append([k, v])
def dijkstra(k, i):
    q = deque()
    visited = [0 for _ in range(vN + 1)]
    q.append(i)
    visited[i] = 1
    cnt = 0
    while q:
        s = q.popleft()
        for w, adj in g[s]:
            if not visited[adj]:
                visited[adj] = 1
                if w >= k:
                    cnt += 1
                    q.append(adj)
    ans.append(cnt)  
for k, v in qestion:
    dijkstra(k, v)
print("\n".join(map(str, ans)))
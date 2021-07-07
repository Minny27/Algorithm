# -*- coding: utf-8 -*-

# 최단경로
# 시간 : 17분
# 구현 아이디어 : dijkstra -> 한 지점 start에서 시작해서 모든 노드까지의 최단거리를 dp에 저장 후 출력

import sys
from heapq import heappop, heappush
input = sys.stdin.readline
vN, eN = map(int, input().split())
start = int(input())
g = [[] for _ in range(vN + 1)]
dp = [sys.maxsize] * (vN + 1)
for i in range(eN):
    n1, n2, w = map(int, input().split())
    g[n1].append([w, n2])
def dijkstra(i):
    hq = []
    dp[i] = 0
    heappush(hq, [0, i])
    while hq:
        firstDist, now = heappop(hq)
        if dp[now] < firstDist:
            continue
        for secondDist, adj in g[now]:
            if dp[adj] > firstDist + secondDist:
                dp[adj] = firstDist + secondDist
                heappush(hq, [dp[adj], adj])
    for i in range(1, len(dp)):
        if dp[i] == sys.maxsize:
            print("INF")
        else:
            print(dp[i])
dijkstra(start)

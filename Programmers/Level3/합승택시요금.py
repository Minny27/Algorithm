# -*- coding: utf-8 -*-

# 합승 택시 요금

from heapq import heappop, heappush
import sys

def dijkstra(node, g, n):
    hq = [[0, node]]
    d = [sys.maxsize] * (n + 1)
    d[node] = 0

    while hq:
        fDist, now = heappop(hq)
        if d[now] < fDist:
            continue
        for sDist, adj in g[now]:
            if d[adj] > fDist + sDist:
                d[adj] = fDist + sDist
                heappush(hq, [d[adj], adj])
    # print(d)
    return d

def solution(n, s, a, b, fares):
    ans = sys.maxsize
    g = [[] for _ in range(n + 1)]

    for data in fares:
        n1, n2, c = data
        g[n1].append([c, n2])
        g[n2].append([c, n1])
    # print(g)
    for node in range(1, n + 1):
        d = dijkstra(node, g, n)
        ans = min(ans, d[s] + d[a] + d[b])
    return ans
print(solution(6, 4, 6, 2, [[4, 1, 10], [3, 5, 24], [5, 6, 2], [3, 1, 41], [5, 1, 24], [4, 6, 50], [2, 4, 66], [2, 3, 22], [1, 6, 25]]))
print(solution(7, 3, 4, 1, [[5, 7, 9], [4, 6, 4], [3, 6, 1], [3, 2, 3], [2, 1, 6]]))
print(solution(6, 4, 5, 6, [[2,6,6], [6,3,7], [4,6,7], [6,5,11], [2,5,12], [5,3,20], [2,4,8], [4,3,9]]))
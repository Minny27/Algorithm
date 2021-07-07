# -*- coding: utf-8 -*-

# 최소비용 구하기 2
# 시간 : 3시간
# 구현 아이디어 : 다익스트라 + dfs로 노드 경로 역추적
# 9%에서 메모리 초과가 발생했는데 이유를 모르겠어서 질문을 통해서 왜 메모리 초과가 발생했는지 알 수 있었음
# 다익스트라는 bfs, dfs와 다르게 visited를 체크하지 않기 때문에 경로의 최소값이 아니면 계속 방문하게 되는데
# 여기서 a에서 b로가는 최단 거리를 구하려고 할 때 dp[a]에 최소값이 들어 있지않으면 a를 거치를 수 있기 때문에 
# trace[a]에 0이 아닌 다른 값이 들어갈 수 있고 무한루프가 발생할 수 있다는 것을 발견할 수 있었다. 그래서 dp[i] = 0 코드가 필요
# 모를 때는 도움을 받는 것이 맞다.. 감사합니다!!
import sys
input = sys.stdin.readline
from heapq import heappop, heappush

# 다익스트라 알고리즘
def dijkstra(i):
    hq = []
    heappush(hq, [0, i])
    dp[i] = 0
    while hq:
        fstCsot, now = heappop(hq)
        if dp[now] < fstCsot:
            continue
        for sndCost, adj in g[now]:
            if dp[adj] > fstCsot + sndCost:
                dp[adj] = fstCsot + sndCost
                heappush(hq, [dp[adj], adj])
                trace[adj] = now # 최단 거리가 되는 인접 노드에 이전 노드 번호를 저장

# a에서 b로 가는 최단 경로 역추적
def minimalTrace(start):
    while 1:
        ans.append(start)
        if not trace[start]:
            break
        start = trace[start]

# 실제 정답 출력
def printAnswer():
    if a == b:
        print(0)
    else:
        print(dp[b])
    print(len(ans))
    for i in reversed(range(len(ans))):
        print(ans[i], end = " ")
    print()

# 변수 초기화
if __name__ == "__main__":
    v = int(input()) # 노드의 개수
    e = int(input()) # 간선의 개수
    g = [[] for _ in range(v + 1)] # 그래프
    dp = [sys.maxsize] * (v + 1) # a에서 모든 노드로 가는 최단 거리를 저장
    for i in range(e):
        n1, n2, c = map(int, input().split())
        g[n1].append([c, n2]) # n1노드에 가중치와 n2노드를 배열 형태로 저장
    a, b = map(int, input().split()) # a -> b
    trace = [0] * (v + 1) # 해당 노드를 오기위해서 거치는 이전 노드를 저장하는 배열
    ans = [] # 역추적한 경로 저장
    dijkstra(a)
    minimalTrace(b)
    printAnswer()

# Test Case
# 2
# 2
# 1 2 2
# 2 1 3
# 1 2
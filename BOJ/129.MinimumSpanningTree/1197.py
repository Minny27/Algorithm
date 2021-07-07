# 최소 스패닝 트리
# 시간 : 2시간
# 구현 아이디어 : 프림알고리즘을 이용한 풀이
# 시간복잡도는 O(n^2)으로 크루스칼알고리즘(Elog2E)보다 느리다.

import sys
from heapq import heapify, heappop, heappush
from collections import defaultdict
input = sys.stdin.readline
v, e = map(int, input().split())
adj = defaultdict(list)
for i in range(e):
    e1, e2, w = map(int, input().split())
    adj[e1].append([w, e1, e2])
    adj[e2].append([w, e2, e1])

def solution():
    visited = {1} # 1번 정점 스타트
    ans = 0
    hq = adj[1] # 1번 정점과 연결된 노드와 가중치 저장
    heapify(hq) # 가중치를 기준으로 힙 정렬
    while hq:
        w, e1, e2 = heappop(hq) # 현재 연결된 노드중에서 가중치가 가장 작은 노드를 pop()
        # 연결되지 않은 노드라면 연결한 것으로 체크하고 현재의 가중치를 ans값에 더하기
        if e2 not in visited:
            visited.add(e2)
            ans += w
            # 그리고 다음 노드와 연결된 노드들 중에 아직 연결되지 않은 노드만 힙에 추가
            for edge in adj[e2]:
                if edge[2] not in visited:
                    heappush(hq, edge)
    return ans
print(solution())
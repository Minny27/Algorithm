# 최소비용 구하기
# 구현 아이디어 : 최소 힙을 이용해서 [가중치, 노드 번호] 형식의 리스트로 저장 후
# 다익스트라 알고리즘 구현

import sys, heapq
input = sys.stdin.readline
nC = int(input()) # num of City -> 노드의 개수
nB = int(input()) # num of Bus -> 간선의 개수
adj = [[] for _ in range(nC + 1)] # 인접한 노드
d = [sys.maxsize] * (nC + 1) # a행에서 b열까지 가는 최소비용
for i in range(nB):
    s, e, w = map(int, input().split()) # start, end, weight
    adj[s].append([w, e])
a, b = map(int, input().split())

def dij():
    h = [] # heap
    heapq.heappush(h, [0, a]) # 자기 자신은  0
    while h:
        nowDist, idx = heapq.heappop(h)
        # 이미 더 비용이 적은 값이 저장되어 있다면 패스
        if d[idx] < nowDist:
            continue
        # a -> ㅁ -> b 로의 거쳐갈 경우, 
        # 이전 간선(a -> ㅁ)의 가중치와 현재 간선(ㅁ -> b)의 가중치의 합과
        # 현재 최소값이 저장되어있는 d[b]를 비교해서 더 작은 값으로 갱신
        for adjDist, i in adj[idx]:
            if d[i] > nowDist + adjDist:
                d[i] = nowDist + adjDist
                heapq.heappush(h, [d[i], i])
    print(d[b])
dij()

# Max Heap 구현
# for num in nums:
#   heapq.heappush(heap, (-num, num))  # (우선 순위, 값)


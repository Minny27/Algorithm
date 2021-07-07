# 파티
# 시간 : 2시간
# 구현 아이디어 : 다익스트라 알고리즘 2번 이용
# 1) 먼저 x 를 제외한 1부터 n 까지의 노드에서 x 까지의 최소 시간 거리를 각각 구해서 ans 배열에 넣기
# 2) 마지막으로 x에서 다른 노드까지의 최소 시간 거리를 구하고 그 각각의 값을 ans에 더하기
# 3) ans에서 최대값을 answer에 넣기
# 4) 갈 수 없는 경우의 예외처리  

import sys
from heapq import heappush, heappop
input = sys.stdin.readline
vertex, edge, x = map(int, input().split())
ans = [0] * (vertex + 1) # 한 노드에서 파티장까지 왔다가는 시간
answer = 0 # ans에서 가장 큰 값
g = [[] for _ in range(vertex + 1)] # 그래프
# 그래프 생성 -> 선택한 노드에 [가중치, 연결된 노드] 형태로 저장
for _ in range(edge):
    s, e, w = map(int, input().split())
    g[s].append([w, e])

def dijkstra(s):
    hq = [] # 힙큐
    dp = [sys.maxsize] * (vertex + 1) # 함수의 입력 값으로 들어온 노드에서의 다른 노드까지의 최소 비용 거리를 구하기
    heappush(hq, [0, s])
    while hq:
        firstdist, now = heappop(hq)
        if dp[now] < firstdist: # 현재 최소값이 저장되어 있다면 패스
            continue
        # 두 개 노드 이상을 거쳐서 최소값이 나올 경우, 첫번째 간선의 가중치 + 두번째 간선의 가중치를 더한 값으로 dp를 갱신
        for seconddist, adj in g[now]:
            if dp[adj] >  firstdist + seconddist:
                dp[adj] = firstdist + seconddist
                heappush(hq, [dp[adj], adj])
    # 만약 시작노드가 파티장(x)이 아니라면 시작노드에서 파티장(x)까지의 최소 거리를 ans에 저장 
    if s != x:
        ans[s] = dp[x]
    # 시작노드가 파티장(x)이라면 각 노드에서 x까지의 최소값을 저장한 ans에 파티장에서 다른 노드까지의 최소값을 각각 저장
    # 이 부분은 가장 마지막에 진행
    else:
        for i in range(1, vertex + 1):
            ans[i] += dp[i]
# x를 제외한 각 노드에서 x까지의 최소값을 저장
for i in range(1, vertex + 1):
    if i != x:
        dijkstra(i)
# x에서 각 노드까지의 최소 거리를 구하기 위해서 마지막으로 수행
for i in range(1):
    dijkstra(x)
# 파티장을 갔다가 돌아온 시간중에서 가장 큰 시간을 answer에 다시 저장
answer = max(ans)
# 한 노드에서 파티장을 갔다가 다시 돌아오는 가장 큰 값보다 크거나 같으면 0, 아니면 answer
if answer >= 199800:
    print(0)
else:
    print(answer)
print(answer)

# Test Case

# 2 1 1
# 1 2 3

# 답 : 0

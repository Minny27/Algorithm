# -*- coding: utf-8 -*-

# 인터넷 설치
# 시간 : 2시간
# 구현 아이디어 : 다익스트라 + 이진탐색
# 어려웠던 부분 : 처음에는 1 -> n으로 가는 모든 경우의 수를 배열에 담고 max를 한 다음에 k만큼 뺴주고 하는 방식을 생각.
# 그 방법이 아닌 같아 보니까 이진탐색을 써야하는 것을 알게 됨.
# 경우의 수
# 1) 공짜로 모두 해결할 수 있는 경우
# 2) 공짜로 모두 해결할 수 없는 경우
    # 1) n으로 가는 경로가 있는 경우
    # 2) n으로 가는 경로가 없는 경우

# 문제 해석
# 1 -> n으로 가는 경로 중에서 가장 큰 가중치의 값(x)가 가장 작은 경우를 찾는 문제 
# 정렬된 숫자 배열에서 하나의 숫자를 찾는 빠른 방법 -> 이진 탐색
# x보다 큰 값을 포함하지 않거나, 포함해도 k보다 작은 경우

# 풀이 방법
# 1) 기존 다익스트라에서는 a -> b 최소 가중치를 d에 저장했는데 최대 값 1개만 찾으면 되므로 d에 a -> b로 가는 횟수를 저장
# 2) 다익스트라를 구하는 과정을 마치면 d[n] <= k 이면 x의 오른쪽을 버리고, d[n] > k 이면 x의 왼쪽을 버리는 방식
# 3) 그 과정으로 나올 수 있는 최소의 x값을 출력

import sys
from heapq import heappop, heappush
input = sys.stdin.readline
n, p, k = map(int, input().split())
g = [[] for _ in range(n + 1)]
ans = -1 # n까지 갈 수 없는 경우를 위해서 -1로 초기화

for i in range(p):
    a, b, c = map(int, input().split())
    g[a].append([c, b])
    g[b].append([c, a])

def dijkstra(x):
    hq = []
    heappush(hq, [0, 1])
    d = [sys.maxsize] * (n + 1)
    while hq:
        fDist, now = heappop(hq)
        if d[now] < fDist:
            continue
        for sDist, adj in g[now]:
            # n으로 가는 횟수를 저장하기 위해서 fDist + sDist 이 아닌 fDist + (sDist > x)
            if d[adj] > fDist + (sDist > x):
                d[adj] = fDist + (sDist > x)
                heappush(hq, [d[adj], adj])
    # n까지 가는 횟수가 k이내이면 x값을 ans에 저장 
    # 횟수가 더 많으면 l = mid + 1
    # x값과 d[n]은 반의 관계를 가지기 때문
    return d[n] <= k

l, r = 0, 1000000
while l <= r:
    mid = (l + r) // 2
    if dijkstra(mid):
        ans = mid
        r = mid - 1
    else:
        l = mid + 1
print(ans)


# 공짜로 모두 해결한 경우
# 4 3 3
# 1 2 1000000
# 2 3 1000000
# 3 4 1000000

# 답 : 0

# 공짜로 해결할 수 없는 경우
# 4 3 0
# 1 2 1000000
# 2 3 1000000
# 3 4 1000000

# 답 : 1000000

# 경로가 없는 경우
# 3 1 2
# 1 2 1000000

# 답 : -1

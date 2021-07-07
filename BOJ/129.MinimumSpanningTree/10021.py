# -*- coding: utf-8 -*-

# Watering the Fields
# 시간 : 3시간
# 구현 아이디어 : 간선간의 거리가 k보다 작은 간선과 edge배열에 [dist, i, j] 
# 9% 테스트 케이스에서 메모리 초과가 발생했는데 그 이유가 간선이 최대 2백만개 미만으로 나오기 때문에
# sort를 하면서 extra space를 사용해서 생기는 이슈라고 귀인님께서 알려주셨습니다. 감사합니다
# 그래서 counting sort로 바꿨고 기존의 정렬 시간복잡도 = O(퀵소트(nlogn) + edges수) 에서 O(n)으로 준다는 것을 배움

import sys
input = sys.stdin.readline
n, c = map(int, input().split())
arr = [list(map(int, input().split())) for _ in range(n)] # xi, yi를 저장
s = [-1] * n # 각 정점이 어떤 정점에 포함된 그래프인지 저장
ans = 0 # 정답
# 각 노드(i)에서 연결된 거리(dist)가 가장 작은 노드(j)를 먼저 저장하기 위해서 [dist, i, j] 형태로 저장
# 노드 번호는 0번부터
edges = [[] for _ in range(2000001)]
# egdes = [[] for _ in range(n)]
for i in range(n - 1):
    x1, y1 = arr[i]
    for j in range(i + 1, n):
        x2, y2 = arr[j]
        dist = (x2 - x1) ** 2 + (y2 - y1) ** 2
        if dist >= c:
            edges[dist].append((i, j))
            # edges.append([dist, i, j])
# edges.sort()
# 각 노드의 부모 노드를 리턴
def getParent(i):
    if s[i] == -1:
        return i
    s[i] = getParent(s[i])
    return s[i]
# 부모 노드를 병합
def unionParent(n1, n2):
    n1 = getParent(n1)
    n2 = getParent(n2)
    # 숫자가 더 작은 부모로 병합 -> n1이 무조건 작으므로 s[n2]에 n1을 저장
    s[n2] = n1
# 비교하는 두 노드의 부모가 같은 지 확인
def find(n1, n2):
    n1 = getParent(n1)
    n2 = getParent(n2)
    if n1 == n2: 
        return 1
    else: 
        return 0
# 사이클이 발생하지 않을 때, 두 노드를 연결하고 가중치를 ans에 더하기
for dist in range(2000001):
    for n1, n2 in edges[dist]:
        if not find(n1, n2):
            unionParent(n1, n2)
            ans += dist
# for i in range(len(edge)):
#     dist, n1, n2 = edge[i]
#     if not find(n1, n2):
#         unionParent(n1, n2)
#         ans += dist            

# 노드가 1개만 있을 때 예외처리
if n == 1:
    print(-1)
    quit(0)
# 최종적으로 모든 노드의 부모가 같으면 ans를 출력하고 아니면 -1
for i in range(1, n):
    if getParent(i) != getParent(0):
        print(-1)
        quit(0)
print(ans)


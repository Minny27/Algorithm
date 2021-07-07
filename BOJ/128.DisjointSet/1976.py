# -*- coding: utf-8 -*-

# 여행 가자
# 시간 : 1시간 반
# 구현 아이디어 : 한 지점에서 한 지점을 갈 수 있는가? -> 최소스패닝 트리인지 아닌지 판별
import sys
input = sys.stdin.readline
n = int(input())
m = int(input())
adj = [list(map(int, input().split())) for _ in range(n)]
route = list(map(int, input().split()))
g = list(range(n + 1))

def find(a):
    if a == g[a]:
        return a
    g[a] = find(g[a])
    return g[a]

def union(a, b):
    a = find(a)
    b = find(b)
    # adj배열의 (행, 열) 에서 열에 행을 넣는 방식 -> 작은 값을 루트로 설정
    g[b] = a

for i in range(n):
    for j in range(n):
        if adj[i][j]:
            # adj[i][j] 값이 1이면 i + 1와 j + 1이 연결되어 있다는 의미
            union(i + 1, j + 1)
# route의 첫 번째 값의 루트를 먼저 찾고 그 노드의 루트와 나머지의 루트가 같은 지를 비교
a = find(route[0])
for i in range(1, m):
    if a != find(route[i]):
        print("NO")
        quit(0)
print("YES")

# 3
# 2
# 0 0 0
# 0 0 0
# 0 0 0
# 1 1

# 5 
# 8
# 0 1 0 1 0
# 1 0 1 1 0
# 0 1 0 0 0 
# 1 1 0 0 0
# 1 0 0 0 0
# 5 1 2 3 2 3 2 2

# 5 
# 8
# 0 1 0 1 0
# 1 0 1 1 0
# 0 1 0 0 0 
# 1 1 0 0 0
# 1 0 0 0 0
# 5 1 2 3 2 3 2 4

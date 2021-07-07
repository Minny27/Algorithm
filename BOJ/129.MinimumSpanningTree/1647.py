# -*- coding: utf-8 -*-

# 도시 분할 계획
# 시간 ; 1시간
# 구현 아이디어 : 크루스칼 -> 전체가 v개로 나누어져 있다고 생각하고 union 될 때마다 그 값을 1씩 줄이고, 2가 되면 출력
# 어려웠던 부분 : 처음에는 문제를 제대로 안 읽어서 트러블이 있었고, 2개로 어떻게 분리할까 생각하다가
# cnt를 만들어서 p 배열을 돌면서 같은 무리가 2개일 때 ans를 출력하는 방식으로 생각을 했는데 시간초과...
# 알게 된 점 : 파이썬 정렬은 sorted + lambda가 빠르다.
# 1) 그래프를 1차원에 넣고 정렬
# 2) union find를 통해서 노드 번호가 작은 곳이 부모가 되게 노드를 잇기
# 3) 이엇을 때만 ans에 가중치를 더하고 cnt에 1빼기
# 4) cnt가 2가될 때 -> 마을이 2개로 분리될 때 출력 후 종료

import sys
input = sys.stdin.readline
v, e = map(int, input().split())
g = []
ans = 0
cnt = v # 그룹의 개수
p = list(range(v + 1))
for i in range(e):
    a, b, c = map(int, input().split())
    g.append([c, a, b])
g = sorted(g, key = lambda k : k[0])

def find(a):
    if p[a] == a:
        return a
    p[a] = find(p[a])
    return p[a]

def union(a, b):
    a = find(a)
    b = find(b)
    if a == b:
        return 0
    a, b = min(a, b), max(a, b)
    p[b] = a
    return 1

for i in range(len(g)):
    c, a, b = g[i]
    if union(a, b):
        ans += c
        cnt -= 1
    if cnt == 2:
        print(ans)
        quit(0)

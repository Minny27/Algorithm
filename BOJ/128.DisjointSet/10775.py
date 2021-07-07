# -*- coding: utf-8 -*-

# 공항
# 시간 : 1시간
# 어려웠던 점 : 문제가 요구하는 것이 무엇인지 이해하기 어려웠고, 
# 알았다고 해도 union-find방식으로 접근해야한다는 것을 알기까지 힘들었습니다.

import sys
input = sys.stdin.readline
g = int(input())
p = int(input())
plane = [int(input()) for _ in range(p)]
parent = list(range(g + 1))
ans = 0

def find(a):
    if a == parent[a]:
        return a
    parent[a] = find(parent[a])
    return parent[a]

def union(a, b):
    a = find(a)
    b = find(b)
    parent[a] = b

for i in plane:
    a = find(i)
    if a == 0:
        break
    union(a, a - 1)
    ans += 1
print(ans)




# -*- coding: utf-8 -*-

# 사이클 게임
# 시간 : 50분
# 구현 아이디어 : 루트 노드를 계속 합치다가 이미 합쳐진 경우가 나오면 출력
import sys
sys.setrecursionlimit(10 ** 8)
input = sys.stdin.readline
n, m = map(int, input().split())
g = list(range(n + 1))

def find(a):
    if a == g[a]:
        return a
    g[a] = find(g[a])
    return g[a]

def union(a, b):
    a = find(a)
    b = find(b)
    if a == b:
        return False
    g[b] = a
    return True

for i in range(1, m + 1):
    a, b = map(int, input().split())
    if not union(a, b):
        print(i)
        quit(0)
print(0)
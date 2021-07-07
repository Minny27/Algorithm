# -*- coding: utf-8 -*-

# 상근이의 여행
# 시간 : 30분
# 구현 아이디어 : 유니온 파인드를 이용해서 첫 번째로 들어온 값을 기준으로 노드를 이어주고
# defaultdict를 이용해서 루트가 다를 경우에만 각 서브트리의 최소 간선 수 + 1로 풀이
import sys
from collections import defaultdict
input = sys.stdin.readline
t = int(input())
ans = []

def solution():
    def find(a):
        if a == g[a]:
            return a
        g[a] = find(g[a])
        return g[a]

    def union(a, b):
        a = find(a)
        b = find(b)
        if a == b:
            return
        g[b] = a
        cnt[a] += cnt[b] + 1
        return

    for i in range(t):
        n, m = map(int, input().split())
        g = list(range(1001))
        cnt = defaultdict(int)
        tmp = 0
        for j in range(m):
            a, b = map(int, input().split())
            union(a, b)
            tmp = a
        ans.append(cnt[find(tmp)])
    print("\n".join(map(str, ans)))
solution()
# -*- coding: utf-8 -*-

# 최대 힙
import sys
from heapq import heappush, heappop
input = sys.stdin.readline
n = int(input())
arr = [int(input()) for _ in range(n)]
hq = []
ans = []
for i in range(n):
    if arr[i] == 0:
        if not hq:
            ans.append(0)
        else:
            ans.append(-heappop(hq))
    else:
        heappush(hq, -arr[i])
print("\n".join(map(str, ans)))
# -*- coding: utf-8 -*-

# 듣보잡
# 시간 : 35분

import sys
input = sys.stdin.readline
n, m = map(int, input().split())
a, b = set(), set()
for i in range(n):
    a.add(input().strip())
for i in range(m):
    b.add(input().strip())
ans = sorted(a.intersection(b))
print(len(ans))
for i in range(len(ans)):
    print(ans[i])

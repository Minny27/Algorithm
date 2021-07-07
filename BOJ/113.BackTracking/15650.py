# -*- coding: utf-8 -*-

# N과 M (2)
# 시간 : 17분

import sys
from itertools import combinations
input = sys.stdin.readline
n, m = map(int, input().split())
arr = combinations(range(1, n + 1), m)
for i in arr:
    for j in i:
        print(j, end = " ")
    print()


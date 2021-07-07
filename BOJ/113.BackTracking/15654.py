# -*- coding: utf-8 -*-

# N과 M (5)
# 시간 : 10분

import sys
from itertools import permutations
input = sys.stdin.readline
n, m = map(int, input().split())
arr = permutations(sorted(list(map(int, input().split()))), m)
for i in arr:
    for j in i:
        print(j, end = " ")
    print()
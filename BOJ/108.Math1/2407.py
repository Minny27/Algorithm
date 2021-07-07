# -*- coding: utf-8 -*-

# 조합
# 시간 : 10분

import sys
from math import factorial
input = sys.stdin.readline
n, m = map(int, input().split())
print(factorial(n) // (factorial(n - m) * factorial(m)))

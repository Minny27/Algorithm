# -*- coding: utf-8 -*-

# 타일 채우기 3
import sys
input = sys.stdin.readline
n = int(input())
if n == 1:
    print(2)
    quit(0)
x, y, z = 2 * n - 2, n - 1, n - 2
print((2 ** x + 2 ** y + 2 ** z) & 1000000007)
# 제로

import sys
from collections import deque
input = sys.stdin.readline
n = int(input())

def solution():
    s = deque() # stack
    for i in range(n):
        num = int(input())
        if num == 0:
            s.pop()
        else:
            s.append(num)
    print(sum(s))
solution()

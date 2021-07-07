# -*- coding: utf-8 -*-

# 문자열 폭발
import sys
input = sys.stdin.readline
s = input().strip()
bomb = input().strip()
l = len(bomb)
stack = []
j = 0 # s에서 t의 몇 번째까지 같은지 비교
for i in range(len(s)):
    stack.append(s[i])
    if s[i] == bomb[-1]:
        if "".join(stack[-l:]) == bomb:
            del stack[-l:]
if stack:
    print("".join(stack))
else:
    print("FRULA")
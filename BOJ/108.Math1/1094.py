# -*- coding: utf-8 -*-

# 막대기
import sys
input = sys.stdin.readline
n = int(input())
cnt = 0
stick = 64
for i in range(6, -1, -1):
    if n >= stick:
        cnt += 1 
        n = n - stick
    if n == 0:
        break
    stick = stick >> 1
print(cnt)  

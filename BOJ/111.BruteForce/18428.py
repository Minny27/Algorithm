# -*- coding: utf-8 -*-

# 감시 피하기

import sys
n = int(input())
g = [input().split() for _ in range(n)]
di = [1, -1, 0, 0]
dj = [0, 0, 1, -1]
cnt = 0

def solution(i, j):
    global cnt
    check = 0
    for k in range(0, j):
        if g[i][k] == 'S':
            break
        if g[i][k] == 'T' and not check:
            cnt += 1
            check = 1
    check = 0
    for k in range(j + 1, n):
        if g[i][k] == 'S':
            break
        if g[i][k] == 'T' and not check:
            cnt += 1
            check = 1
    check = 0
    for k in range(0, i):
        if g[k][j] == 'S':
            break
        if g[k][j] == 'T' and not check:
            cnt += 1
            check = 1
    check = 0
    for k in range(i + 1, n):
        if g[k][j] == 'S':
            break        
        if g[k][j] == 'T' and not check:
            cnt += 1
            check = 1

for i in range(n):
    for j in range(n):
        if g[i][j] == 'S':
            solution(i, j)
if cnt <= 3:
    print("Yes")
else:
    print("NO")
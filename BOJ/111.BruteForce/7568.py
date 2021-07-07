# 덩치

import sys
input = sys.stdin.readline
n = int(input())
man = [list(map(int, input().split())) for _ in range(n)]
ans = []

def solution():
    for i in range(n):
        rank = 1
        for j in range(n):
            if i == j:
                continue
            if man[i][0] < man[j][0] and man[i][1] < man[j][1]:
                rank += 1
        ans.append(rank)
    print(" ".join(list(map(str, ans))))
solution()

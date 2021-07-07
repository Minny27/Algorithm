# 가르침
# 시간 : 1시간

import sys
input = sys.stdin.readline
n, k = map(int, input().split())
word = [input().strip() for _ in range(n)]

def solution():
    pre = "anta"
    suf = "tica"
    alpha = [0] * 26
    alpha[ord('a')], alpha[ord('n')], alpha[ord('t')], alpha[ord('i')], alpha[ord('c')] = 1, 1, 1, 1, 1
    k -= 5
    ans = 0
    while k >= 0:
        for i in range(n):
            if len(word[i]) < 8:
                word[i] = '-1'
            else: 
                if word[i][:4] == pre and word[i][-4:] == suf:
                    word[i] = word[i][4 : -4]
        word.sort(len)
        for i in range(n):
            if word[i] == '-1':
                continue
            if len(word[i]) == 0:
                ans += 1
                continue
            for j in range(len(word[i])):
                if not alpha[word[i][j]]:
                    alpha[word[i][j]] = 1



solution()
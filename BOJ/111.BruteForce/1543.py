# 문서 검색

import sys
input = sys.stdin.readline
str1 = input().strip('\n')
str2 = input().strip('\n')
ans = 0

i, j = -1, 0
while i < len(str1):
    i += 1
    if i == len(str1):
        print(ans)
        quit()
    if j == len(str2) - 1 and str1[i] == str2[j]:
        ans += 1
        j = 0
        continue
    if str1[i] == str2[j]:
        j = j + 1
        continue
    if str1[i] != str2[j]:
        i = i - j
        j = 0

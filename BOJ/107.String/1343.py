# -*- coding: utf-8 -*-

# 폴리오미노
import sys
input = sys.stdin.readline
s = input().strip()
cnt = 0
check = 0
ans = ''
for i in range(len(s)):
    if s[i] == 'X':
        cntㅐㅏ += 1
        check = 0
        if i == len(s) - 1:
            if cnt % 2 == 1:
                print(-1)
                quit(0)
            else:
                ans += 'AAAA' * (cnt // 4) + 'B' * (cnt % 4)
    else:
        if not check:
            check = 1
            if cnt % 2 == 1:
                print(-1)
                quit(0)
            else:
                ans += 'AAAA' * (cnt // 4) + 'B' * (cnt % 4)
            cnt = 0
        ans += '.'
print(ans)

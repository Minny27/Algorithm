# 무어기계
# 시간 : 1시간 20분

import sys, re
input = sys.stdin.readline
n = int(input())

def solution():
    answer = []
    for i in range(n):
        ans = ''
        p, s = input().rstrip(), input().rstrip() # pattern, string
        cnt = 0 # '_'을 알파벳으로 대체했을 때 몇 개가 맞는지
        for j in range(65, 91):
            alpha = chr(j)
            tmp = p.replace('_', alpha)
            p1 = re.compile(tmp)
            m = p1.fullmatch(s)
            if m:
                cnt += 1
                ans = alpha
        if cnt == 0:
            answer.append('!')
        elif cnt == 26:
            answer.append('_')
        else:
            answer.append(ans)
    print("\n".join(list(map(str, answer))))
solution()
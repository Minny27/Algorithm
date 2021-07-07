# LCS
# 입력이 없거나 스페이스 바 등의 예외를 생각하다가 더 오래 걸렸던 것 같다.
# 시간 :1시간 반

import sys
input = sys.stdin.readline
s1 = " " + input()[:-1]
s2 = " " + input()[:-1]

def solution(s1, s2):
    dp = [[0 for _ in range(len(s1))] for _ in range(len(s2))]
    for i in range(1, len(s2)):
        for j in range(1, len(s1)):
            dp[i][j] = max(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1] + int(s2[i] == s1[j]))
    print(dp[len(s2) - 1][len(s1) - 1])
solution(s1, s2)

# Test Case
# aaaa
# aaa

# 답 : 3

# aaa
# aaaa

# 답 : 3

#   (스페이스바 2번)
#   (스페이스바 2번)
# 답 : 2
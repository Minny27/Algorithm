# 영화감독 숌

import sys
input = sys.stdin.readline
n = int(input())

def solution(n):
    ans = 666
    cnt = 0
    while n - cnt > 0:
        s = str(ans)
        if s.find("666") != -1:
            cnt += 1
        if cnt == n:
            break
        ans += 1
    print(ans)
solution(n)


# 수학은 딸리는 걸로..
# def solution():
#     s = "666"
#     i = 0 # i번째 군
#     plus = 1 # 계차
#     sum = 1 # 군에서의 첫 번째 값
#     while 1:
#         if i % 2 == 0:
#             plus *= 5
#             sum += plus
#             if n // (sum + 1) == 0:
#                 sum -= plus
#                 plus //= 5
#                 break
#         else:
#             plus *= 2
#             sum += plus
#             if n // (sum + 1) == 0:
#                 sum -= plus
#                 plus //= 5
#                 break
#         i += 1
#     if i % 2 == 0:
#         if n == 1:
#             print(666)
#         else:
#             print(str(n - sum) + s)
#     else:
#         print(s + str(n - sum - 1))
# solution()

# Test Case

# 13

# 답 : 6666

# 14

# 답 : 6667

# 1

# 답 : 666

# 2

# 답 : 1666

# 7

# 답 : 6660

# 26

# 답 : 16660

# 27

# 답 : 16661


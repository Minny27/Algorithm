# 배
# 시간: 3시간

import sys
input = sys.stdin.readline
n = int(input())
crane = list(map(int, input().split()))
m = int(input())
box = list(map(int, input().split()))
crane.sort(reverse = 1)
box.sort(reverse = 1)

def solution():
    visited = [0] * len(box)
    ans = 0
    cnt = 0
    if crane[0] < box[0]:
        print(-1)
        return
    while cnt < len(box):
        idx = 0 # 크레인 인덱스
        i = 0 # 박스 인덱스
        while i < len(box):
            if idx == len(crane):
                break
            if not visited[i] and crane[idx] >= box[i]:
                visited[i] = 1
                idx += 1
                cnt += 1
            i += 1
        ans += 1
    print(ans)
solution()


# bisect 시간 초과
# def solution():
#     start = len(crane) - 1
#     i = len(crane) - 1
#     cnt = 0
#     if crane[-1] < box[-1]:
#         print(-1)
#         return
#     while box:
#         cnt += 1
#         i = start
#         while i > -1:
#             if not box:
#                 break
#             # tmp = bl(box, crane[i])
#             idx = 0
#             if bl(box, crane[i]) == len(box):
#                 idx = bl(box, crane[i]) - 1
#             else:
#                 idx = bl(box, crane[i])
#             if crane[i] >= box[idx]:
#                 box.remove(box[idx])
#             else:
#                 start -= 1
#             i -= 1
#     print(cnt)
# solution()

# 3
# 6 8 9
# 4
# 7 7 8 9

# 답 : 2

# 3
# 6 8 9
# 4
# 9 9 9 9

# 답 : 4

# 3
# 6 8 9
# 4
# 2 2 2 2

# 답 : 2

# 3
# 6 8 9
# 3
# 9 10 11

# -1
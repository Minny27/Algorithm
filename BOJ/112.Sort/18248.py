# 제야의 종
# 구현 아이디어 : 먼저 리스트의 모든 원소가 0 또는 1로 이루어진 친구들 이외에 리스트는 제 하고
# 해시테이블을 이용해서 value값을 내림차순 기준으로 key를 정렬 후, 그 키를 기준으로 새롭게 gCopy 리스트를 생성
# i번째 행의 k번째 열을 기준으로 밑의 원소와 비교했을 때 종을 기준으로 더 가까이 있는 사람이 못들은 소리를 가깝지 않은 사람이 들으면 NO
# 모든 경우의 수를 통과하면 YES

import sys
from bisect import bisect_left as bl
input = sys.stdin.readline
n, m = map(int, input().split())
g = [list(map(int, input().split())) for _ in range(n)]
far = {} # i번째 사람 : 종을 기준 몇 번째 -> 해시 형태로 저장

def solution():
    gCopy = []
    for i in range(n):
        cnt = g[i].count(1)
        if cnt != m and cnt != 0:
            far[i] = cnt
    tmp = sorted(far.items(), key = lambda key : key[1], reverse = 1)
    for i in range(len(tmp)):
        gCopy.append(g[tmp[i][0]])
    for i in range(len(tmp) - 1): # 해시 테이블 인덱스
        for k in range(m): # 해시 테이블 원소의 열
            for j in range(1, len(tmp) - i): # 해당 원소 이외의 원소의 행
                if gCopy[i][k] == 0 and gCopy[i + j][k] == 1:
                    print("NO")
                    return
    print("YES")
solution()

# def solution():
#     gCopy = []
#     gCopyLen = 0
#     for i in range(n):
#         g = list(map(int, input().split()))
#         if g[0].count(1) != m and g[0].count(1) != 0:
#             gCopy.append(g)
#             gCopyLen += 1
#     for i in range(gCopyLen):
#         for j in range(m):
#             if 

# Test Case
# 4 4
# 0 0 0 1
# 0 0 0 0
# 0 0 0 0
# 1 1 1 0

# 답 : 
# NO

# Test Case
# 4 4
# 0 0 0 1
# 0 0 0 0
# 1 1 0 0
# 1 1 1 0

# 답 : 
# NO
   
# 4 4
# 0 1 0 0
# 1 0 1 0
# 0 0 0 0
# 1 1 1 0

# 답 : 
# NO

# 4 4
# 1 0 0 0
# 1 0 1 0
# 1 1 1 0
# 1 1 1 0

# 답 : 
# YES
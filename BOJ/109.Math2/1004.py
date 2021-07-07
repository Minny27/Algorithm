# 어린 왕자
# 원의 중점과 반지름이 주어질 때마다 시작, 끝 점 둘 다 포함 혹은 둘 중의 하나라도 포함 않하면 배제 후 시작 또는 끝 점을 포함하고 있는 원의 개수 파악

import math

n = int(input())
arr = [0 for i in range(n)] # 출력을 위한 배열

for i in range(n):
    cnt = 0 # 합계
    x1, y1, x2, y2 = map(int, input().split()) # 출발, 도착점
    n_c = int(input()) # 원의 개수
    for j in range(n_c):
        cx, cy, r = map(int, input().split())
        # 두 점을 모두 포함하는 원은 배제
        if math.sqrt(math.pow(cx - x1, 2) + math.pow(cy - y1, 2)) < r and math.sqrt(math.pow(cx - x2, 2) + math.pow(cy - y2, 2)) < r:
            continue
        # 한 점만 포함하는 원만 세주기
        if math.sqrt(math.pow(cx - x1, 2) + math.pow(cy - y1, 2)) < r or math.sqrt(math.pow(cx - x2, 2) + math.pow(cy - y2, 2)) < r:
            cnt += 1
        arr[i] = cnt
    # print(cnt) // 출력은 어떻게 나와도 상관없다는 것을 알았다...
for i in range(n):
    print(arr[i])







# 원은 사각형이 아니다!!!!
# num = int(input()) # 입력 개수
# arr = [0 for _ in range(num)] # 출력 저장 배열
# for i in range(num):
#     cnt = 0 # 통과하는 원의 개수
#     x1, y1, x2, y2 = map(int, input().split()) # 시작, 끝 점
#     cnum = int(input()) # 원 수
#     for _ in range(cnum):
#         cx, cy, r = map(int, input().split())
#         if (x1 >= cx - r and x1 <= cx + r) and (y1 >= cy - r and y1 <= cy + r) and (x2 >= cx - r and x2 <= cx + r) and (y2 >= cy - r and y2 <= cy + r): # 출발점 그리고 도착점을 포함하는 경우 패스
#             continue 
#         if ((x1 >= cx - r and x1 <= cx + r) and (y1 >= cy - r and y1 <= cy + r)) or ((x2 >= cx - r and x2 <= cx + r) and (y2 >= cy - r and y2 <= cy + r)): # 출발점 또는 도착점을 포함하는 경우 + 1
#             cnt += 1
#         else: continue # 나머지는 패스
#     arr[i] = cnt

# for i in range(num):
#     print(arr[i])
       


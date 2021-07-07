# 음계
# 시간 : 5분

import sys
input = sys.stdin.readline
asc = [1,2,3,4,5,6,7,8]
des = [8,7,6,5,4,3,2,1]
arr = list(map(int, input().split()))
if arr == asc:
    print("ascending")
elif arr == des:
    print("descending")
else:
    print("mixed")
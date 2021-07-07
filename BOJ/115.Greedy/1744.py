# 수 묶기
# 시간 1시간 반

import sys
input = sys.stdin.readline
n = int(input())
arr = [0] * n
for i in range(n):
    arr[i] = int(input())
arr.sort()
def solution():
    if n == 1:
        print(arr[0])
        return
    ans = 0
    i = 0 # -부분
    j = n - 1 # + 부분
    while i <= n - 1 and j >= 0:
        if i <= n - 2 and arr[i] <= 0 and arr[i + 1] <= 0:
            ans += arr[i] * arr[i + 1]
            i += 2
        elif arr[i] < 0:
            ans += arr[i]
            i += 2
        else:
            i += 2
        if j >= 1 and arr[j - 1] > 0 and arr[j] > 0:
            ans += max(arr[j - 1] * arr[j], arr[j - 1] + arr[j])
            j -= 2
        elif arr[j] > 0:
            ans += arr[j]
            j -= 2
        else:
            j -= 2
    print(ans)
solution()

# Test Case

# 5
# -2
# -1
# 1
# 2
# 3
# 답 : 9

# 5
# 1
# 2
# 3
# 4
# 5
# 답 : 27

# 2
# -1
# -2
# 답 : 2
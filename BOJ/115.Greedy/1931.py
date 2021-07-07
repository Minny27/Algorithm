# 회의실배정
import sys
input = sys.stdin.readline
n = int(input())
arr = [list(map(int, input().split())) for _ in range(n)]
arr.sort(key = lambda k : (k[1], k[0])) # 회의 끝나는 시간 오름차순 정렬 후, 시작 시간 오름차순정렬
def solution():
    ans = 0
    s = -1
    for i in range(n):
        if arr[i][0] >= s:
            s = arr[i][1]
            ans += 1
    print(ans)
solution()

# Test Case

# 5
# 4 4
# 4 4
# 3 4
# 2 4
# 1 4

# 답 : 3

# 5
# 0 1
# 1 2
# 2 2
# 2 3
# 3 3

# 답 : 5

# 5
# 4 5
# 4 4
# 3 4
# 2 5
# 1 3

# 답 : 4

# 3
# 2 3
# 3 5
# 4 4

# 답 : 2
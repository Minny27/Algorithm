# 텀 프로젝트
import sys
from collections import deque
input = sys.stdin.readline
n = int(input())
ans = []

def bfs(start, stu):
    q = deque()
    check = set()
    check = []
    q.append(start)
    while q:
        s = q.popleft()
        if dp[stu[s]] == 2:
            check.append(s)
            ss = check.index(stu[s])
            for i in range(ss, len(check)):
                dp[check[i]] = 1
            for i in range(ss):
                dp[check[i]] = 0
            check = []
        if (dp[s] == 100001 or dp[s] == 1) and s == stu[s]:
            dp[s] = 1
            if check:
                for i in check:                    
                    dp[i] = 0
        elif dp[s] == 100001 or dp[s] == 2:
            check.append(s)
            q.append(stu[s])
            dp[s] = 2
        else:
            for i in check:
                dp[i] = 0

for i in range(n):
    l = int(input())
    dp = [100001] * (l + 1)
    stu = [0] + list(map(int, input().split()))
    for i in range(1, l + 1):
        if dp[i] == 100001:
            bfs(i, stu)
    ans.append(dp.count(0))
print("\n".join(list(map(str, ans))))


# def dfs(s, e, visited, cnt):
#     if visited[e]:
#         return
#     if e == stu[e]:
#         visited[e] = 1
#         result[0] += 1
#         return
#     if s == e:
#         visited[e] = 1
#         result[0] += cnt
#         return
#     dfs(s, stu[e], visited, cnt + 1)

# for _ in range(n):
#     l = int(input())
#     stu = [0] + list(map(int, input().split()))
#     result = [0]
#     visited = [0] * len(stu)
#     for i in range(1, len(stu)):
#         if not visited[i]:
#             dfs(i, stu[i], visited, 1)
#     ans.append(len(stu) - result[0] - 1)
# print("\n".join(list(map(str, ans))))
# solution()


# Test Case
# 2
# 7
# 3 1 3 7 3 4 6
# 8
# 1 2 3 4 5 6 7 8

# 7
# 6
# 2 3 4 5 6 2
# 5
# 2 5 4 5 2
# 6
# 1 3 4 3 2 6
# 13
# 2 4 5 2 4 1 8 9 10 11 9 10 10
# 10
# 2 5 7 1 6 8 8 3 5 10
# 10
# 2 7 10 5 3 3 9 10 6 3
# 6
# 2 1 1 2 6 3

# 답:
# 1
# 3
# 2
# 8
# 6
# 8
# 4

# 1
# 6
# 2 3 4 5 6 2

# 답 : 1

# Test Case

# 1
# 6
# 2 3 4 5 6 2

# 답 : 1

# 1
# 5
# 2 5 4 5 2

# 답 : 3

# 1
# 6
# 1 3 4 3 2 6

# 답 : 2

# 1
# 5
# 3 1 2 2 2
# 답 : 2

# 1
# 10
# 2 5 7 1 6 8 8 3 5 10

# 답 : 6

# 1
# 10
# 2 7 10 5 3 3 9 10 6 3

# 답 : 8

# 1
# 6
# 2 1 1 2 6 3

# 답 : 4
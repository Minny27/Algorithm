# 로봇 조종하기
# 시간 : 7시간

import sys
INF = sys.maxsize
input = sys.stdin.readline
n, m = map(int, input().split()) # 세로 가로
g = [[-INF] + list(map(int, input().split())) for _ in range(n)]
up = [[-INF] + [-INF for _ in range(m)] for _ in range(n)]
left = [[-INF] + [-INF for _ in range(m)] for _ in range(n)]
right = [[-INF] + [-INF for _ in range(m)] for _ in range(n)]

def solution():
    left[0][1] = up[0][1] = g[0][1]
    for i in range(2, m + 1):
        left[0][i] = left[0][i - 1] + g[0][i]
    if n > 1:
        for i in range(1, n):
            for j in range(1, m + 1):
                    up[i][j] = max(up[i - 1][j], left[i - 1][j], right[i - 1][j]) + g[i][j]
            for j in range(1, m + 1):
                left[i][j] = max(up[i][j - 1], left[i][j - 1]) + g[i][j]    
            for j in range(m - 1, 0, -1):
                right[i][j] = max(up[i][j + 1], right[i][j + 1]) + g[i][j]
    print(max(left[n - 1][m], up[n - 1][m]))
solution()



# 9% 에서 시간초과...
# import sys
# sys.setrecursionlimit(10 ** 8)
# input = sys.stdin.readline
# n, m = map(int, input().split()) # 세로 가로
# g = [list(map(int, input().split())) for _ in range(n)]
# visited = [[0 for _ in range(m)] for _ in range(n)]
# di = [1, 0, 0]
# dj = [0, 1, -1]

# def dfs(i, j, d):
#     if i == n - 1 and j == m - 1:
#         return g[i][j]
#     ans = -sys.maxsize - 1
#     for k in range(3):
#         ii = di[k] + i
#         jj = dj[k] + j
#         if 0 <= ii < n and 0 <= jj < m and not visited[ii][jj]:
#             visited[ii][jj] = 1
#             ans = max(ans, dfs(ii, jj, k) + g[i][j])
#             visited[ii][jj] = 0
#     return ans
    
# visited[0][0] = 1
# print(dfs(0, 0, 0))
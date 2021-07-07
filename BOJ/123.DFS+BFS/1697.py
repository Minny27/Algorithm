# 숨바꼭질
# 시간 : 1시간 반
# DFS로 풀이하려고 했지만 같은 지점을 다시 방문할 때 
# visited에 대한 처리를 하지 못해서 종료 조건을 만들 수 없어서 bfs로 변경..
# queue로 구현할 때는 같은 너비를 같게 count해야 하기 때문에
# 현재의 큐에서의 길이만큼 for문을 돌리고 cnt를 증가하는 방식으로 구현
# 아직 dfs는 많이 부족한 것같다...

import sys
from collections import deque
input = sys.stdin.readline
n, k = map(int, input().split())
visited = [0] * 150000

def bfs(n):
    q = deque()
    q.append(n)
    visited[n] = 1
    cnt = 0
    while q:
        l = len(q)
        for _ in range(l):
            n = q.popleft()
            if n == k:
                print(cnt)
                return
            for j in range(3):
                if j == 0 and n < k and abs(2 * n - k) <= abs(n - k):
                    nn = 2 * n
                    if not visited[nn]:
                        visited[nn] = 1
                        q.append(nn)
                elif j == 1 and n > 0:
                    nn = n - 1
                    if not visited[nn]:
                        visited[nn] = 1
                        q.append(nn)
                elif j == 2 and n < k:
                    nn = n + 1
                    if not visited[nn]:
                        visited[nn] = 1
                        q.append(nn)
        cnt += 1
bfs(n)

# def dfs(n, cnt):
#     if n == k:
#         ans[0] = min(ans[0], cnt)
#         return
#     if n < k and abs(2 * n - k) <= abs(n - k):
#         # if not visited[2 * n]:
#         dfs(2 * n, cnt + 1)
#     if n >= 0:
#         if not visited[n - 1]:
#             visited[n] = 1
#             dfs(n - 1, cnt + 1)
# dfs(n, 0)
# print(ans[0])

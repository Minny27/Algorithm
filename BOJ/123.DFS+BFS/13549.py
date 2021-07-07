# -*- coding: utf-8 -*-

# 숨바꼭질 3
# 시간: 2시간
# 구현 아이디어 : bfs
# 1) n이 k보다 크면 -로 밖에 갈 수 없으므로 n -k, n == k이면 같은 위치이므로 시간은 0
# 2) bfs로 가중치가 0인 *2, 가중치가 1인 -1, 1 순서대로 진행
# 3) 여기서 중요한 것은 범위값인데 예를들어 n = 75000, k = 100000 이면 *2를 하고 -1하는 것이 더 느리다는 것을 이용
# 4) s - 1은 0보다 크거나 같고 s + 1은 100000보다 작거나 같아야한다.

import sys
from collections import deque
input = sys.stdin.readline
n, k = map(int, input().split())
if n > k:
    print(n - k)
    quit(0)
if n == k:
    print(0)
    quit(0)

def bfs(i):
    q = deque()
    visited = [0] * 150001
    q.append([0, i])
    visited[i] = 1
    while q:
        cnt, s = q.popleft()
        if s == k:
            print(cnt)
            return
        for i in range(3):
            if s * 2 <= 150000 and not visited[s * 2]:
                    visited[s * 2] = 1
                    q.append([cnt, s * 2])
            elif s - 1 >= 0 and not visited[s - 1]:
                    visited[s - 1] = 1
                    q.append([cnt + 1, s - 1])
            elif s + 1 <= 100000 and not visited[s + 1]:
                    visited[s + 1] = 1
                    q.append([cnt + 1, s + 1])
bfs(n)
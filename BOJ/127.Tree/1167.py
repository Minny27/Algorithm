# -*- coding: utf-8 -*-

# 트리의 지름
# 시간 : 2시간
# 구현 아이디어 : dfs -> 한 노드(1)에서의 가장 가중치가 큰 지름이 되는 위치(ans[0])에서의 최대 지름을 구하는 방식
# 트리의 지름 정의가 노드의 길이를 말하는 줄 알았는데,, 가중치였다...
# 1) 1번 노드와 연결된 노드를 for문을 타면서 dfs 수행
# 2) i번 노드에서 다음 노드로 갈 때마다 횟수와 가중치를 더해주기
# 3) dfs로 깊이가 가장 깊은 노드에 도착했을 때 ans에 지름이 최대일 떄의 가중치의 최대값을 갱신
# 4) 최개 값을 갱신 후 노드 번호(d)와 가중치(c)을 해당 위치의 가중치를 뺸값으로 리턴
# 5) visited를 갱신, 1번 노드에서 가장 긴 지름에서의 노드 위치(ans[0])에서 다시 dfs를 수행, ans[1] 출력

import sys
input = sys.stdin.readline
n = int(input())
g = [[] for _ in range(n + 1)]
ans = [0, 0] # 가중치
d = 0 # 한 지점에서의 트리의 지름
visited = [0] * (n + 1)

for _ in range(n):
    line = list(map(int, input().split()))
    s = line[0]
    for j in range(1, len(line) - 1, 2):
        e, w = line[j], line[j + 1]
        g[s].append([e, w])
def dfs(i, start, c):
    if visited[i]:
        return
    global d
    visited[i] = 1
    for j in range(len(g[i])):
        if g[i][j][0] == start:
            continue
        if not visited[g[i][j][0]]:
            d = g[i][j][0]
            c += g[i][j][1]
            dfs(g[i][j][0], start, c)
            # 1번 노드에서 가장 깊은 노드에서 빽도할 때 해당 위치에서의 가중치를 빼고 리턴
            d, c = d - 1, c - g[i][j][1]
    if ans[1] < c:
            ans[0], ans [1] = d, c

dfs(1, 1, 0)
# 위의 dfs에서 visited를 한 번 사용했기 때문에 갱신
visited = [0] * (n + 1)
dfs(ans[0], ans[0], 0)
print(ans[1])

# 4
# 1 2 5 3 9 -1
# 2 1 5 -1
# 3 1 9 4 8 -1
# 4 3 8 -1
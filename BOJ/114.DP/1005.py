# ACM Craft
# 시간 : 3시간
# 구현 아이디어 : 위상 정렬 + 
# 처음에는 시작점이 root 노드이거나 깊이가 가장 깊은 리프노드라고 생각했는데.. 
# root노드에서만 시작할 수 있다는 것을 늦게 알았다..

import sys
from collections import deque
input = sys.stdin.readline
t = int(input())

def solution():
    ans = [0] * t
    for ti in range(t):
        n, k = map(int, input().split())
        c = [0] + list(map(int, input().split())) # 완공 시간
        adj = [[] for _ in range(n + 1)] # 각 노드별 연결 상태
        degree = [0] * (n + 1) # 자식기준으로 부모가 연결된 개수
        pastMax = [0] * (n + 1) # 이전 노드까지의 시간의 최대 값
        q = deque()
        for _ in range(k):
            x, y = map(int, input().split())
            adj[x].append(y)
            degree[y] += 1 # y노드의 부모노드의 개수
        w = int(input())
        # 같은 레벨에 여러 노드가 있을 수 있기 때문에 n개의 노드를 모두 방문해서
        # 부모노드의 개수가 0인 노드들을 모두 q에 넣기
        for j in range(1, n + 1):
            if not degree[j]:
                q.append(j)
        while q:
            s = q.popleft()
            # pastMax의 a(자식노드) 번째 인덱스에 현재 저장되어 있는 값과 s(부모노드) 이전까지의 가장 큰 값 + 부모노드의 시간
            for nxt in range(len(adj[s])):
                a = adj[s][nxt] # adjacent
                pastMax[a] = max(pastMax[a], pastMax[s] + c[s])
                degree[a] -= 1
                # s(부모노드)를 끊은 a(자식노드)의 부모 노드가 없다면 q에 넣기
                if not degree[a]:
                    q.append(a)
        ans[ti] = pastMax[w] + c[w]
    print("\n".join(map(str, ans)))
solution()
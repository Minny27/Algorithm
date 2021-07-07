# -*- coding: utf-8 -*-

# 카드 짝 맞추기
# 구현 아이디어 : 순열 + bfs

from collections import deque
import sys

gBoard = [] # board의 글로벌 변수
d = [[-1, 0], [1, 0], [0, -1], [0 , 1]]

def boundary(i, j):
    return 0 <= i < 4 and 0 <= j < 4

def bfs(src, dst):
    visited = [[0 for _ in range(4)] for _ in range(4)]
    q = deque()
    q.append(src)
    while q:
        curr = q.popleft()
        # 같은 번호의 카드를 만났을 때 횟수 리턴
        if curr[0] == dst[0] and curr[1] == dst[1]:
            return curr[2]
        for i in range(4):
            ni = curr[0] + d[i][0]
            nj = curr[1] + d[i][1]
            if not boundary(ni, nj):
                continue
            if not visited[ni][nj]:
                visited[ni][nj] = 1
                q.append([ni, nj, curr[2] + 1])
            # 컨트롤 + 방향키 구현
            for j in range(2):
                # 현재 진행하고 있는 방향에 이미 카드가 있으면 break
                if gBoard[ni][nj] != 0:
                    break
                # 현재 진행하고 있는 방향을 전진 했을 때 범위를 넘어가면 break
                if not boundary(ni + d[i][0], nj + d[i][1]):
                    break
                # 범위를 넘지 않았다면 해당 방향에서 전진
                ni += d[i][0]
                nj += d[i][1]
            # 컨트롤 + 방향키 지점의 방문 체크 후 큐에 append
            if not visited[ni][nj]:
                visited[ni][nj] = 1
                q.append([ni, nj, curr[2] + 1])

def permutate(r, c, cnt):
    src = [r, c, cnt]
    ans = sys.maxsize
    for cardNum in range(1, 7):
        card = [] # cardNum인 카드의 순서를 고려해서 나올 수 있는 조합의 좌표를 담는 배열
        for i in range(4):
            for j in range(4):
                if gBoard[i][j] == cardNum:
                    card.append([i, j, 0])

        # 모든 카드를 뒤집은 경우
        if not card:
            continue

        one = bfs(src, card[0]) + bfs(card[0], card[1]) + 2 # 첫 지점[r, c]에서 특정 번호의 첫 번째 카드좌표에서 두 번째 카드좌표까지의 최단거리
        two = bfs(src, card[1]) + bfs(card[1], card[0]) + 2 # 첫 지점[r, c]에서 특정 번호의 두 번째 카드좌표에서 첫 번쨰 카드좌표까지의 최단거리

        # 이미 방문한 두 좌표는 0으로
        for i in range(2):
            gBoard[card[i][0]][card[i][1]] = 0

        ans = min(ans, one + permutate(card[1][0], card[1][1], card[1][2])) # 특정 번호의 두 번째 카드 좌표에서 시작해서 모든 카드를 지우는 최단 거리
        ans = min(ans, two + permutate(card[0][0], card[0][1], card[0][2])) # 특정 번호의 첫 번째 카드 카드에서 시작해서 모든 카드를 지우는 최단 거리

        # 특정 번호에서의 결과값을 얻은 후에는 다시 그 위치를 원래의 카드 넘버로 초기화
        for i in range(2):
            gBoard[card[i][0]][card[i][1]] = cardNum
    
    # 보드위가 모두 0일 때
    if ans == sys.maxsize:
        return 0
    # 그렇지 않을 때
    return ans

def solution(board, r, c):
    global gBoard
    gBoard = board
    return permutate(r, c, 0)

print(solution([[1,0,0,3],[2,0,0,0],[0,0,0,2],[3,0,1,0]], 1, 0))
print(solution([[3,0,0,2],[0,0,1,0],[0,1,0,0],[2,0,0,3]], 0, 1))
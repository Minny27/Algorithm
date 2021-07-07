# -*- coding: utf-8 -*-

# 배열 돌리기 4
# 시간 : 3시간
# 구현 아이디어 : dfs + 순열
# 1) 그래프(g)를 먼저 그리고 테스트 케이스(case)를 순열로 초기화
# 2) 박스 범위 내의 대각선 값을 기준으로 dfs 함수로 한 바퀴씩 갱신
# 3) 갱신된 그래프(gCopy)의 행 값 중 가장 작은 값을 ans에 저장
# 4) ans에서 가장 작은 값을 출력
import sys, copy
from itertools import permutations
input = sys.stdin.readline
n, m, k = map(int, input().split())
g = [list(map(int, input().split())) for _ in range(n)]
case = [list(map(int, input().split())) for _ in range(k)]
case = list(permutations(case)) # 케이스로 나올 수 있는 조합(순열)
di = [0, 1, 0, -1]
dj = [1, 0, -1, 0]
ans = []

# 그래프의 대각선 값들이 들어왔을 때 cathe에 있는 값을 한 바퀴를 돌면서 갱신
# 한 바퀴를 돌 때 다음 위치의 있는 값을 이전 위치에 있는 값으로 갱신
def dfs(i, j, didx):
    global sr, er, sc, ec, cathe, cnt
    cnt += 1
    if not sr <= i <= er or not sc <= j <= ec:
        didx = (didx + 1) % 4 # index 초과를 막기 위해서 4로 나눈 나머지 값 저장
        if not visited[i - di[didx - 1] + di[didx]][j - dj[didx - 1] + dj[didx]]:
            dfs(i - di[didx - 1] + di[didx], j - dj[didx - 1] + dj[didx], didx)
    elif sr <= i <= er and sc <= j <= ec and not visited[i][j]:
        visited[i][j] = 1
        gCopy[i][j], cathe = cathe, gCopy[i][j]
        dfs(i + di[didx], j + dj[didx], didx)

for a in case:
    gCopy = copy.deepcopy(g) # 원본을 훼손하지 않기 위해서 복사
    for b in a:
        r, c, s = b
        sr, er = r - s - 1, r + s - 1 # 0, 4
        sc, ec = c - s - 1 , c + s - 1 # 1, 5
        cathe = 0 # dfs 박스로 돌 때 이전 값을 저장하는 변수
        didx = 0 # 방향 idx
        visited = [[0 for _ in range(m)] for _ in range(n)]
        # 방문은 (sr, sc)를 기준으로 대각선으로만 서치
        for i in range(sr, er):
            for j in range(sc, sc + 1):
                cnt = 0 # 도는 배열이 1개일 경우의 예외처리 위한 변수
                if not visited[i][j]:
                    visited[i][j] = 1
                    cathe = gCopy[i][j] # cathe에 현재 위치의 값을 저장
                    dfs(i, j + 1, 0)
                    # cnt가 1인 경우는 도는 배열이 1개인 경우
                    # 그 이외에는 처음 위치의 값(i, j)에 dfs에서 마지막으로 방문한 값을 넣기
                    if cnt != 1:
                        gCopy[i][j] = cathe
            # 네모를 줄이는 과정
            sr, er, sc, ec = sr + 1, er - 1, sc + 1, ec - 1
    minValue = sys.maxsize
    # 순열의 조합을 하나씩 돌면서 그래프의 행의 최소 값을 갱신
    for i in range(n):
        minValue = min(minValue, sum(gCopy[i]))
    ans.append(minValue)
print(min(ans))
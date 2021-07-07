# -*- coding: utf-8 -*-

# 배열 복원하기
# 시간 32분
# 구현 아이디어 : 두 번째 조건에 겹치는 부분이 더하기라고 생각해서 문제가 잘 안 보여서 오래 걸림
# b(큰 행렬)과 a(작은 행렬)이 겹치는 부분만 b[i][j]를 이동하기 전 a에서의 위치 값을 뺀 것을 그린다음 출력
import sys
input = sys.stdin.readline
h, w, x, y = map(int,1471 input().split()) # 세로 가로
b = [list(map(int, input().split())) for _ in range(h + x)]
# 시작점은 처음으로 겹치는 위치 b[x][y] -> 몇 개가 겹치냐? -> x + h - x까지 겹치는 것을 발견
for i in range(x, x + h - x):
    for j in range(y, y + w - y):
        b[i][j] -= b[i - x][j - y] 
for i in range(h):
    for j in range(w):
        print(b[i][j], end = " ")
    print()
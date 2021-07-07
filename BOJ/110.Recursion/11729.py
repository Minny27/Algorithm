# 하노이 탑 이동 순서
# 구현 아이디어 : 1번 기둥에서 2번 기둥까지 원판을 n - 1개 옮기고 1번 기둥에서 2번기둥으로 원판을 1개 옮기고
# 2번 기둥에 있는 n - 1개의 원판을 3번기둥으로 옮기기

import sys

input = sys.stdin.readline
n = int(input())
sum = 1

def hanoi(n, a, b, c):
    if n == 1:
        print(a, c)
    else:
        hanoi(n - 1, a, c, b)
        print(a, c)
        hanoi(n - 1, b, a, c)
for i in range(n - 1):
    sum = sum * 2 + 1
print(sum)
hanoi(n, 1, 2, 3)
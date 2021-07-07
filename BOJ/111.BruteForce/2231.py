# 분해합
# n을 str로 받고 길이를 구한 후, for문 시작값을 n - 9 * l로 자리수에 9로 이루어진 값을 뺀 수부터 시작
# 예외사항은 1 ~ 9까지는 0, 값이 없는 수도 0이기에 for문이 끝나고 print(0)

import sys
input = sys.stdin.readline
n = input().strip()
l = len(n)

def solution(n, l):
    s = n - 9 * l # Start
    for i in range(s, n):
        sum = i
        tmp = i
        while tmp > 0:
            sum += tmp % 10
            tmp = tmp // 10
        if sum == n:
            print(i)
            return
    print(0)
solution(int(n), l)
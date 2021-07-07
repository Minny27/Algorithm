# 소인수분해
# 루트 n + 1까지 약수를 찾고 없으면 n을 출력하는 방식이 빠르다..

import sys, math
input = sys.stdin.readline
n = int(input())

def solution(n):
    # ans =[]
    s = ""
    for i in range(2, int(n ** 0.5 + 1)):
        if n % i == 0:
            while n % i == 0:
                n = n // i
                # ans.append(i)
                s += str(i) + "\n"
        if n == 1:
            break
    if n > 1:
        s += str(n) + "\n"
    # print("\n".join(list(map(str, ans))))
    print(s)
solution(n)
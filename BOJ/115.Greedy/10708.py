# 크리스마스 파티

import sys

def solution():
    input = sys.stdin.readline
    n = int(input())
    m = int(input())
    target = list(map(int, input().split()))
    ans = [0] * n
    for i in range(m):
        guys = list(map(int, input().split()))
        for j in range(n):
            if guys[j] == target[i]:
                ans[j] += 1
            else:
                ans[target[i] - 1] += 1
    print("\n".join(list(map(str, ans)))) # s 로 출력하는 것과 시간 똑같음
solution()
    # for i in range(1, len(ans)):
    #     s += str(ans[i]) + "\n"
    # print(s)
# print("\n".join(list(map(str, ans))))


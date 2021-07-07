# 나는야 포켓몬 마스터 이다솜
# 시간 : 23분
# 구현 아이디어 : 처음에는 중첩 for문으로 문제를 해결하려고 했지만
# O(n^2)의 시간 복잡도로 최대 10 ** 10까지 올라갈 수 있어 시간 초과가 발생
# 그래서 똑같은 숫자와 똑같은 포켓몬인 없다는 가정하에 두개의 dict를 만들어서
# key를 각각 영어와 숫자로 분배해서 문제를 해결했다.
# O(n^2) 에서 O(n + m)으로 시간 복잡도를 낮춘셈이다.

import sys
input = sys.stdin.readline
n, m = map(int, input().split())
ht1 = dict()
ht2 = dict()
ans = []
for i in range(n):
    pocket = input().strip()
    ht1[i + 1] = pocket
    ht2[pocket] = i + 1
for j in range(m):
    line = input().strip()
    if line.isalpha():
        ans.append(ht2[line])
    else:
        ans.append(ht1[int(line)])

print("\n".join(map(str, ans)))


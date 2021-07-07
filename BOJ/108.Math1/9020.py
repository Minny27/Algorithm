# 골드바흐의 추측
# 구현 아이디어 : 일일이 세는 것은 시간초과.
# 에라토스 테네시의 체로 소수를 구하고 소수마다 2개의 값을 pn[] 에 넣고
# 구하고자 하는 값의 1/2 만큼 시행해서 pn[i] - pn[j]가 min보다 작으면 값을 갱신하고
# 해당 pn[i], pn[j]를 튜플 형태로 ans에 넣고 출력
# 일단은 pypy3으로 통과는 됐지만 나중에 다시 해볼 것...
# 슬라이싱을 이용해서 소수를 O(n) 의 속도로 줄일 수 있다는 것이 중요

import sys

n = int(sys.stdin.readline().strip())
nn = [int(input()) for _ in range(n)]
pn = [] # 입력 값 중 가장 큰 수 이전까지의 소수 값들
ans = [()] * n

# 소수를 에라토스테네스의 체로 구하기
def prime(k):
    visited = [1] * 10000
    for i in range(2, k):
        if visited[i]:
            pn.append(i)
            pn.append(i)
        for j in range(i * 2, k, i):
            visited[j] = 0

# 2는 4이외에는 사용이 되지 않는다는 것을 염두
def solution(k, idx):
    min = 10000
    i = 0
    while k > pn[i]:
        if min == 0:
            return
        if k - pn[i] not in pn:
            {}
        else:
            if abs(pn[i] - (k - pn[i])) < min:
                min = abs(pn[i] - (k - pn[i]))
                ans[idx] = pn[i] > k - pn[i] and (k - pn[i], pn[i]) or (pn[i], k - pn[i])
        i += 1
        if i == len(pn):
            return
prime(max(nn))
for i in range(n):
    solution(nn[i], i)
for i in range(n):
    print(ans[i][0], ans[i][1])

# print("\n".join(list(map(str, ans))))


# 기존 코드는 O(n2) 의 시간이 걸려서 시간초과...
# def solution(k, idx):
#     min = 10000
#     i = 0
#     while k > pn[i]:
#         for j in range(i):
#             if pn[i] + pn[j] == k and i - j < min:
#                 min = i - j
#                 ans[idx] = (pn[j], pn[i])
#         i += 1
#         if i == len(pn):
#             return    
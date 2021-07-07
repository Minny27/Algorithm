# 카드 정렬하기
# 시간 : 44분
# 구현 아이디어 : 처음에는 sort를 해서 반복문으로 arr[i] + arr[i + 1] 방식을 생각했는데 메모리초과가 발생...
# 힙을 이용해서 n이 2보다 작으면 0, 2보다 크거나 같으면 minheap에서 가장 작은 값 두 개를 더한 값을 ans에 더하고
# 더한 두개의 값을 다시 힙에 넣어서 정렬하는 방식

import sys
from heapq import heappush, heappop
input = sys.stdin.readline
n = int(input())
hq = []
for i in range(n):
    heappush(hq, int(input()))

def solution():
    ans = 0
    while len(hq) >= 2:
        tmp = heappop(hq) + heappop(hq)
        ans += tmp
        heappush(hq, tmp)
    print(ans)
solution()


# 처음 코드 -> 메모리 초과
# import sys
# input = sys.stdin.readline
# n = int(input())
# arr = []
# for i in range(n):
#     arr.append(int(input()))
# arr.sort()

# def solution():
#     ans = 0
#     for i in range(n - 1):
#         ans += arr[i] + arr[i + 1]
#         arr[i + 1] = ans
#     print(ans)
# solution()
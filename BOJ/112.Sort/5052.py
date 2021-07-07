# 전화번호 목록
# 시간 : 35분
# 배운점 : zip() 함수와 startswith함수를 배웠고 스트링 정렬에 대한 감? 을 좀 알 수 있었다.

import sys
input = sys.stdin.readline
t = int(input())

def isSame(pn):
    for n1, n2 in zip(pn, pn[1:]):
        if n2.startswith(n1):
            return True
    return False

def solution():
    ans = []
    for k in range(t):
        n = int(input())
        pn = sorted([input().strip() for _ in range(n)]) # phone number
        if isSame(pn):
            ans.append("NO")
        else:
            ans.append("YES")
    print("\n".join(list(ans)))
solution()
            
# 시간이 4896ms가 걸리는 코드가 있다?
# def solution():
#     for k in range(t):
#         n = int(input())
#         pn = sorted([input().strip() for _ in range(n)], key = len) # phone number
#         for i in range(n - 1):
#             for j in range(i + 1, n):
#                 if pn[i] == pn[j][:len(pn[i])]:
#                     ans[k] = ("NO")
#                     break
#             if ans[k]:
#                 break
#         if not ans[k]:
#             ans[k] = "YES"
#     print("\n".join(list(ans)))
# solution()
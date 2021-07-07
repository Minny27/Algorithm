# 귀여운 라이언
# 구현 아이디어 : 투 포인터를 이용해서 첫 번째 포인터(ii)로 1을 탐색하며 1의 개수를 세고 
# 1의 개수가 k개가 됐을 때 두 번째 포인터(jj)는 처음 위치에서 다음 1의 위치로 옮긴 후
# jj - ii 의 값과 현재 ans에 저장되어 있는 값과 비교해서 작은 값을 저장 및 출력
# 하핫.. 도와주셔서 감사합니다!!

import sys

# n, k = list(map(int, input().split()))
# nn = list(map(int, input().split()))
n, k = map(int, sys.stdin.readline().split())
nn = list(map(int, sys.stdin.readline().split()))

def solution():
    idx = list() # 1이 나온 인덱스 배열
    j = 0 # idx 배열의 인덱스
    ii = 0 # 1로 이동하는 포인터
    jj = 0 # 1의 개수가 k일 때, 다음 1이 나오는 인덱스로 이동하는 포인터
    one = 0 # 1의 개수
    ans = sys.maxsize # 최소값을 갱신한 결과값
    for i in range(n):  
        if nn[i] == 1:
            ii = i
            one += 1
            idx.append(i)
        if one == k:
            one -= 1
            jj = idx[j]
            j += 1
            sum = ii - jj
            ans = min(ans, sum + 1)
            sum -= jj
    # 예외가 발생할 때
    if len(idx) < k:
        print(-1)
        return 
    else: 
        print(ans)
solution()

# Test Case

# 10 3
# 1 2 2 2 1 2 1 2 2 1

# 답 : 6

# 10 1
# 1 2 2 2 1 2 1 2 2 1

# 답 : 1

# 10 2
# 1 2 2 2 1 2 1 2 2 1

# 답 : 3

# 10 4
# 1 2 2 2 1 2 1 2 2 1

# 답 : 10

# 7 2
# 2 1 2 1 2 2 2 1 2

# 답 : 3

# 7 1
# 2 1 2 2 1 2 2

# 답 : 2

# 8 1
# 1 2 2 2 1 2 2 1 2

# 답 : 2

# 20 3
# 1 2 2 2 1 2 1 2 2 1 1 2 2 2 1 2 1 2 2 1

# 답 : 5

# 5 1
# 2 1 2 2 1

# 답 : 2

# 8 2
# 2 1 2 1 2 2 1 2

# 답 : 3

# 6 2
# 2 2 2 2 2 2

# 답 : -1

# 7 2
# 2 1 1 2 1 2 1

# 답 : 2

# 7 3
# 2 1 1 2 1 2 1

# 답 : 4
# 수들의 합 2
# 시간 : 21분
# 구현 아이디어 : 투포인터
# 배운 점 : 투포인터에서 중요한 부분은 s, e의 범위가 중요하기 때문에 
# i) m보다 값이 작을 때
# ii) m보다 값이 같을 때
# iii) m보다 값이 클 때
# 범위를 나누어서 전체 배열의 인덱스를 넘어가지 않으면서 반복되는 코드가 없도록 짜는 것이 포인트이다.

import sys
input = sys.stdin.readline
n, m = map(int, input().split())
arr = list(map(int, input().split()))

def solution():
    ans, s, e = 0, 0, 0
    sum = arr[s]
    while 1:
        if sum == m:
            ans += 1
        if sum <= m:
            e += 1
            if e >= n:
                break
            sum += arr[e]
        else:
            s += 1
            e = s
            if s >= n:
                break
            sum = arr[s]
    print(ans)
solution()

# Test Case
# 5 5
# 5 5 5 5 5
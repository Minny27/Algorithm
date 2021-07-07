# 격자상의 경로
# 구현 아이디어 : 
# k = 0 이면 n+m-2Cn-1 -> 콤비네이션 개념
# k값이 0 이외라면 격자를 k까지(dp1) 그리고 k부터 n * m까지(dp2)를 만들어서 
# 해당 위치에서의 왼쪽과 위쪽의 값을 합한 값으로 업데이트

import math
n, m, k = list(map(int, input().split())) # 2 2 4

def solution(n, m, k):
    if k == 0:
        print(math.factorial(n + m - 2) // (math.factorial(m - 1) * math.factorial(n - 1)))
        return
    ii = math.ceil(k / m) # 2
    jj = k % m == 0 and m or k % m # 2
    dp1 = [[1 for c in range(jj)] for r in range(ii)]
    for i in range(ii):
        for j in range(jj):
            if i - 1 < 0 or j - 1 < 0:
                continue
            else:
                dp1[i][j] = dp1[i-1][j] + dp1[i][j-1]
    dp2 = [[dp1[ii - 1][jj - 1] for _ in range(m - jj + 1)] for _ in range(n - ii + 1)]
    for i in range(n - ii + 1):
        for j in range(m - jj + 1):
            if i - 1 < 0 or j - 1 < 0:
                continue
            else:
                dp2[i][j] = dp2[i-1][j] + dp2[i][j-1]
    print(dp2[n - ii][m - jj])
    return
solution(n, m, k)

# Test Case
# 3 5 8
# 답 : 9

# 3 5 0
# 답 : 15

# 7 7 43
# 답 : 1

# 7 7 38
# 답 : 105

# 2 2 1
# 답 : 2

# 2 2 4
# 답 : 2
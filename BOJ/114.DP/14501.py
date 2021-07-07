# 퇴사
# 오늘부터 + t[i] 후 + 1씩 더하는 DFS 방식
num = int(input())
dp = [0 for i in range(1)] # 각 날짜마다 받을 수 있는 최고 금액
t = [0 for i in range(num + 1)]  # 상담시간
p = [0 for i in range(num + 1)]  # 수익

# DFS를 n번 진행, 전역변수를 함수안에서 사용하기 위해서 입력값을 두 개로 설정
def dfs(n, sum):
    # 마지막 상담(num + 1)일 때
    if n == len(t):
        if dp[0] < sum:
            dp[0] = sum
        return

    # 전체 상담 일수(n + 1)을 넘어갈 때 
    if n > len(t):
        return

    dfs(n + t[n], sum + p[n])
    dfs(n + 1, sum)
    # return 
        

for i in range(1, num + 1):
    k, v = map(int, input().split())
    t[i] = k
    p[i] = v

dfs(1, 0)
print(dp[0])

# max = dp[1]

# for i in range(2, n + 1):
#     max = max > dp[i] and max or dp[i]
# print(max)

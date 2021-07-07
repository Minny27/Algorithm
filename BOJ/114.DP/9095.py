# 1, 2, 3 더하기
# DFS로 0을 만드는 값에서만 1씩 더한다.

dp = [0 for _ in range(1)]
def dfs(num):
    if num == 0:
        dp[0] += 1
        return
    if(num > 0):
        dfs(num - 1)

    if(num > 1):
        dfs(num - 2)

    if(num > 2):
        dfs(num - 3)
    # return
    
n = int(input())
k = [0 for i in range(n)]

for i in range(n):
    num = int(input())
    dfs(num)
    k[i] = dp[0]
    dp[0] = 0

for i in range(n):
    print(k[i])
    


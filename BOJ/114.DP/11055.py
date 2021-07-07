# 가장 큰 증가 부분 수열
# 구현 아이디어 : dp에 기존 증가 부분 수열의 값과 다음 수열을 비교 후, 갱신

n = int(input()) # 입력 개수
num = [int(_) for _ in input().split()] # 입력한 수열
dp = [0] * n # 해당 인덱스에서의 최장 증가 수열들의 합
dp[0] = num[0]
# 현재의 인덱스에서 이전까지를 모두 비교해서 
# 해당 숫자보다 작을 때만 dp에서 가장 큰 수와 현재 수를 더한 값을 저장
for i in range(n):
    for j in range(i):
        if num[i] > num[j]:
            dp[i] = max(num[i] + dp[j], dp[i])
        # 맨 처음 인덱스에 큰 수가 왔을 때 예외처리
        elif num[i] <= num[j] and dp[i] == 0:
            dp[i] = num[i]
print(max(dp))

# # 메모이제이션 변수
# maxValue = [0 for _ in range(1)] # dfs상에서의 가장 큰 수
# flag1 = [0 for _ in range(n)] # 이미 더한 값은 1 
# curve = [0 for _ in range(n)] # 커지다가 갑자기 작아지는 인덱스
# flag2 = [0 for _ in range(1)] # 갑자기 작은 값이 나왔을 때 flag

# def dfs(k, idx):
#     # dp에 이미 더해진 인덱스는 리턴
#     if flag1[k] == 1:
#         return
#     # 크기가 n - 1이 되면 리턴
#     if k >= n - 1:
#         return
#     # max값보다 작으면 curve값에 k값을 대입
#     if maxValue[0] > num[k + 1]:
#         if flag2[0] == 0:
#             curve[idx] = num[k + 1]
#             flag2[0] = 1
#         dfs(k + 1, idx)
#         return
#     elif maxValue[0] <= num[k + 1]:
#         dp[idx] += num[k + 1]
#         maxValue[0] = num[k + 1]
#         flag1[idx] = 1
#         dfs(k + 1, idx)
#         return
#     maxValue[0] = num[idx]
#     flag2[0] = 0
#     dfs(curve[0], idx + 1)
#     return

# for i in range(n):
#     maxValue[0] = num[i]
#     dp[i] = maxValue[0]
#     if flag1[i] == 0:
#         dfs(i, i)

# for i in range(n):
#     ans[0] = max(ans[0], dp[i])



# for i in range(n):
#     for j in range(i + 1):
#         if ans[0] <= num[i]:
#             dp[i] += ans[0] + num[i]
#             ans[0] = dp[i]
#             break
#         if num[i] >= num[j]:
#             dp[i] += num[j]
#         ans[0] = max(ans[0], dp[i])
# print(ans[0])


# def findMax(x, y):
#     ans[0] = max(x, y)

# for i in range(n):
#     findMax(ans[0], dp[i])

# Test Case
# 6
# 1 100 3 4 1000 8

# 7
# 1 100 3 4 99 1000 8

# 6
# 1 3 5 2 4 6

# 6
# 10 1 2 3 4 5

# 답
# 1101 
# 1107
# 15
# 15

# 머리 에러남..
# # 메모이제이션 변수
# maxValue = [0 for _ in range(1)] # 현재 가장 큰 수 저장
# flag = [0 for _ in range(n)] # 이미 더한 값은 1
# curve = [0 for _ in range(n)] # 커지다가 갑자기 작아지는 인덱스

# def dfs(k, idx):
#     # dp에 이미 더해진 인덱스는 리턴
#     if flag[k, idx] == 1:
#         return
#     # 크기가 n - 1이 되면 리턴
#     if k >= n - 1:
#         return
#     # max값보다 작으면 curve값에 k값을 대입
#     if max > num[k + 1]:
#         curve[k] = k + 1
#     elif max <= num[k + 1]:
#         dp[idx] += num[k + 1]
#         maxValue[0] = num[k + 1]
#         flag[idx] = 1
#         dfs(k + 1, idx)
#         return
#     dfs(curve[0])
#     return

# for i in range(n):
#     maxValue[0] = num[i]
#     dp[i] = maxValue[0]
#     if flag[i] == 0:
#         dfs(i, i)

# for i in range(n):
#     ans[0] = max(ans[0], dp[i]) 
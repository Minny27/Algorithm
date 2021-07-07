# 색종이
arr = [[0 for col in range(100)] for row in range(100)] # 도화지
k = int(input()) # 색종이 갯수
cnt = 0 # 넓이

# 도화지에 각각의 색종이의 넓이만큼 1을 찍어줌
for i in range(k):  
    m, n = map(int, input().split())
    for j in range(n, n + 10):
        for z in range(m, m + 10):
            arr[z][j] = 1

# 배열의 값이 1 이면 cnt를 추가
for i in range(100):
    for j in range(100):
        if arr[j][i] == 1:
            cnt += 1    
print(cnt)
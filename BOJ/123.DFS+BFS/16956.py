# 늑대와 양 
# 구현 아이디어 : 먼저 테두리를 포함한 목장(map)을 만들고 목장을 스캔하면서 '.' 이면 울타리(D)로 변경 양(S)이 나오면
# 양(S) 기준 왼, 오, 아, 위에 늑대(W) 가 있는지 확인 후 있으면 0 출력 후 종료

n, m = map(int, input().split())
map = [['.'] * m] * (n + 2) # 테두리를 포함해서 목장 생성
ans = 1 # 늑대를 막을 수 있으면 1 없으면 0
for i in range(0, n + 2):
        # 맨 끝 테두리 행만 따로 '.' 추가
        if i == 0 or i == n + 1:
            map[i] = map[i] + ['.'] + ['.']
        # 테두리를 제외한 농장은 처음과 끝에 '.' 테두리를 생성하고 input을 넣기
        else:
            map[i] = ['.'] + [s for s in input()] + ['.']

# 'S' 일 때 위 아래 양 옆이 'W'가 있는지 확인하고 있으면 0출력, 그 외 '.'이면 'D'를 저장
for i in range(1, n + 1):
    for j in range(1, m + 1):
        if map[i][j] == 'S':
            if map[i - 1][j] == 'W' or map[i + 1][j] == 'W' or map[i][j - 1] == 'W' or map[i][j + 1] == 'W':
                ans = 0
                print(0)
                break
        elif map[i][j] == '.':
            map[i][j] = 'D'
            
# 늑대를 막을 수 있을 경우
if ans == 1:
    print(1)
    for i in range(1, n + 1):
        for j in range(1, m + 1):
            print(map[i][j], end = '')
        print()

# 2차원 배열 빈칸 없이 출력하는 방법 연습...
# print(map[0][2], end = '', flush = True)
# for i in :
#     for j in range(m):
#         print(map[i][j], end = '', flush = True)
#     print()

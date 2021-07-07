# 한 줄로 서기
# 구현 아이디어 : arr 배열의 끝에서부터 값이 0이면 0번째 인덱스에 값을 넣고
# 0이 아닌 값이면 ans 배열에 있는 모든 수와 비교하면서 큰 수를 발견하면 arr[i] 의 값을 1씩 줄여가며
# 0이 되면 ans[j + 1]에 i를 삽입하기

n = int(input())
# idx = [i for i in range(n + 1)] # 키가 n번째로 작은 사람
arr = [0] + list(map(int, input().split())) # 각 사람 별 왼쪽에 키 큰 인원
ans = [] # 정답 배열
# s = "" # 한 칸씩 출력을 위한 변수

for i in range(len(arr) - 1, 0, -1):
    if arr[i] == 0:
        ans.insert(0, i)
    else:
        for j in range(len(ans)):
            if ans[j] > i:
                arr[i] -= 1
                if arr[i] == 0:
                    ans.insert(j + 1, i)
print(" ".join(map(str, ans)))

# Test Case
# 4
# 2 1 1 0

# 답 : 4 2 1 3

# 4
# 3 2 1 0

# 답 : 4 3 2 1

# 4
# 0 0 0 0

# 답 : 1 2 3 4

# 5
# 0 0 2 1 0

# 답 : 1 2 5 4 3

# 5
# 0 0 1 1 0

# 답 : 1 2 5 3 4
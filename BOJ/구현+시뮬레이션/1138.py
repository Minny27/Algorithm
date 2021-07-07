# 한 줄로 서기
# 아이디어 : 해시테이블에 입력값을 저장 후, 첫번째 인덱스부터 value값에 해당하는 위치에 먼저 배치
# 배치가 이미 되어 있는 경우, 해당 인덱스의 뒤에 배치
# 키는 1부터 시작하지만 저장할 인덱스는 0부터

n = int(input())
man = [-1] + [int(_) for _ in input().split()] # 사람별 키 큰 사람 입력 값
ht = {} # 해시 테이블 변수
ans = [-1 for _ in range(n)] # 답

for i in range(1, n + 1):
    ht[i] = man[i]

for i in range(1, n + 1):
    tall = ht.get(i) # 1번 사람부터 별로 왼쪽에 큰 사람 저장
    # 자신보다 큰 사람이 한 명이라도 있다면 왼쪽에 있는 모든 사람들을 자신과 비교
    if tall >= 1:
        for j in range(i - 1):
            if i > ans[i] and tall > 0:
                tall -= 1


    # value값에 해당하는 ans의 index에 값이 없으면 값을 넣기
    if ans[tall] == -1:
        ans[tall] = i
    # 값이 있다면 값이 없을 때 까지 인덱스를 증가시키고 없으면 값을 넣기
    else:
        while 1:
            tall += 1
            if ans[tall] == -1: 
                ans[tall] = i
                break
print(' '.join(str(ans)))
            
# Test Case
# 4
# 3 2 1 0

# 4
# 3 1 1 0

# 4
# 2 2 1 0

# 4
# 1 1 0 0

# 4
# 2 1 0 0

# 답
# 4 3 2 1
# 4 2 3 1
# 4 3 1 2
# 3 1 2 4
# 3 2 1 4
    
    


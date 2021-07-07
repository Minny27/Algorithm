# 문자열
# 구현 아이디어 : 앞에서 추가하든 뒤에서 추가하든 추가하는 원소는 st1과 st2 모두 같다고 가정할 때
# 앞에서 추가를 늘렸을 때 다른 원소가 최소가 되는 위치에서의 최소 찾기

st1, st2 = input().split()
cnt = [0] * (len(st2) - len(st1) + 1)
for i in range(len(st2) - len(st1) + 1):
    for j in range(len(st1)):
        if st1[j] != st2[j + i]:
            cnt[i] += 1
print(min(cnt))

# Test Case
# adaabc aababbc
# 답 : 2

# azc xyabcxy
# 답 : 1
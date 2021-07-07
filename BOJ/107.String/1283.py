# 단축키 지정
# 시간 : 3시간
# 구현 아이디어 :
# 1) 한 줄을 입력 받을 때마다 해당 문자열의 단어들의 첫번째 단어가 단축키로 설정되어있는지 확인 -> 안 되어있다면 설정
# 2) 단어들의 두번째 단어부터 확인
# 어려웠던 점 : 대소문자가 구분되지 않은 입력, 한 단어로만 이루어진 문자열, 띄어쓰기로 이루어진 단어

import sys
input = sys.stdin.readline
n = int(input())

def solution():
    alpha = [0] * 26 # 알파벳 사용 여부
    idx = -1 # 단축키가 설정될 인덱스
    ans = [''] * n # 정답
    for k in range(n):
        word = " ".join(input().split()) # 인덱싱을 위한 word
        wordArr = word.split() # 각 단어의 첫번째 알파벳 확인하기 위한 word배열
        check = [0, 0] # [단어의 첫번째 알파벳에서 발견, 단어의 두번째 알파벳 이상에서 발견]
        l = 0 # wordArr에서 단어의 길이를 누적으로 더하는 변수
        # 단어의 첫번째 음절에서 발견될 때
        for j in range(len(wordArr)):
            tmp = wordArr[j][0].lower()
            if not alpha[ord(tmp) - ord('a')]:
                alpha[ord(tmp) - ord('a')] = 1
                idx = l
                check[0] = 1
                break
            l += len(wordArr[j]) + 1
        l = 0
        # 단어의 두번째 음절이상에서 발견될 때
        if not check[0]:
            for i in range(len(wordArr)):
                # 이미 발견 됐을 때
                if check[1]:
                    break
                for j in range(1, len(wordArr[i])):
                    tmp = wordArr[i][j].lower()
                    if not alpha[ord(tmp) - ord('a')]:
                        alpha[ord(tmp) - ord('a')] = 1
                        idx = l + j
                        check[1] = 1
                        break
                l += len(wordArr[i]) + 1
        # 첫번째나 두번째 이상의 음절에서 단축키를 설정할 수 있는 경우
        if check[0] or check[1]:
            ans[k] = word[:idx] + '[' + word[idx] + ']' + word[idx + 1:]
        # 단축키를 설정할 수 없는 경우
        else:
            ans[k] = word
    print("\n".join(map(str, ans)))
solution()

# Test Case
# 2
# Save
# Save A

# 16
# ppush zzz
# ppush zzz
# ppush zzz
# Push ush
# front
# back
# size
# empty
# pop
# pop
# pop
# size
# empty
# pop
# push
# empty
# front

# 10
# New
# Open
# Save
# Save As
# Save All
# save ass
# save abc
# save abd
# save abc
# abdc

# [N]ew
# [O]pen
# [S]ave
# Save [A]s
# Sa[v]e All
# sav[e] ass
# save a[b]c
# save ab[d]
# save ab[c]
# abdc

# 4
# a b
# b c
# a c
# a b c

# [a] b
# [b] c
# a [c]
# a b c

# 2
#     a    b bcd
# a  a  acd

# 답 : 
# [a] b bcd
# a a a[c]d
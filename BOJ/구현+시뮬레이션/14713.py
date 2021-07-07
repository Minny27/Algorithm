# -*- coding: utf-8 -*-

# 앵무새 - 실패
# 문장 전체를 뺏을 수는 없다...
# 구현 아이디어 : 앵무새가 말한 단어의 집합 arr[i][j]와 문장가능 여부의 l[k]를 비교해서 연속적으로 맞으면 '0'을 저장
# k가 이전 while에서 값과 동일하면 불가능, k가 l 배열을 모두 확인해서 되면 가능
# 1) 단어의 집합을 2차원 배열 형태로 단어 하나씩 arr생성, 받아 적은 내용 l배열 생성
# 2) while문 안에서 l과 2차원 배열을 처음부터 비교하며 연속해서 나올 수 있는 단어 이면 '0'으로 방문 표시
# 3) 비교했을 때 같으면 arr와 l모두 '0'으로 바꾸고 k를 증가
# 4) 만약 k가 n(l의 마지막 인덱스까지 모두 비교한 상태) 이 되면 가능
# 5) 만약 마지막 행에서 이미 방문한 다음 인덱스에서 찾지 못하면 불가능

import sys
input = sys.stdin.readline
n = int(input())
arr = [list(input().split()) for _ in range(n)] # 앵무새가 말한 문장들
l = list(input().split()) # 받아적은 내용
past = 0 # 이전 while문에서의 k값
k = 0 # l 배열의 인덱스
s = [] # stack
check = [0] * n # 각 행의 마지막 인덱스에 있는 단어를 스택에 넣은 것을 체크하기 위한 배열
while 1: 
    for i in range(len(arr)):
        for j in range(len(arr[i])):
            # 일치한 것을 확인한 단어는 패스
            if arr[i][j] == '0':
                continue
            # 받아 적어서 나올 수 없는 단어이면 다음 행
            if arr[i][j] != l[k]:
                break
            # 받아 적은 내용과 앵무새가 말한 단어가 일치할 때 '0'을 넣고, k의 값 증가
            if arr[i][j] == l[k]:
                if check[i] == 0:
                    s.append(arr[i][len(arr[i]) - 1])
                    check[i] = 1
                if j == len(arr[i]) - 1:
                    if s[-1] == arr[i][j]:
                        s.pop()
                    else:
                        print("Impossible")
                        quit(0)
                # 만약 받아적은 내용이 모두 일치하면 가능
                arr[i][j] = '0'
                k += 1
                if k >= len(l):
                    print("Possible")
                    quit(0)
    # 앵무새가 말한 모든 단어를 봤는데도 연속해서 나올 수 없는 단어라면 불가능
    if past == k:
        print("Impossible")
        quit(0)
    past = k


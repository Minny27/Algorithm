# -*- coding: utf-8 -*-

# 메뉴 리뉴얼
# 시간 : 2시간
# 구현 아이디어 : 정렬 + 빡구현
# 처음에 문제를 제대로 이해하지 못해서 나올 수 있는 조합의 개수가 같은 경우면 모두 출력하는 것을 생각
# 조합의 개수 중 크거나 같은 값을 출력하는 것을 알게됨
# 1) 순열 피하기 위해서 cArr에 orders에 있는 각각의 문자열을 sort해서 저장
# 2) 문자열마다에서 나올 수 있는 모든 조합을 course[2, 3, 5]의 값을 기준으로 저장
# 3) 모든 조합(combi)를 알파벳순으로 정렬
# 4) 모든 조합을 확인하면서 임시저장 변수 tmp, 같은 조합을 세는 변수 cnt, 조합의 개수마다의 최대값을 저장하는 배열 rank 생성
# 5) 같은 조합이 나오다가 다른 조합이 나올 때 ans1에 [최대값, (조합)] 방식으로 저장
# 6) ans1을 내림차순 정렬 후, ans1의 원소를 확인하면서 해당 조합의 길이의 최대값과 일치하면 ans에 해당 조합만 저장
# 알게된 점 : 다른 사람들의 풀이를 보니까 Collections.Counter() 함수를 활용할 수 있다는 것을 배웠음.
# 어려웠던 점 : 조합의 마지막 인덱스에서 값을 계산하지 못하는 것을 생각하지 못해서 좀 오래걸렸다..


# 코스 -> 최소 2가지 메뉴, 2명 이상의 손님
# 가장 많이 주문된 조합 -> 정렬

from itertools import combinations

def solution(orders, course):
    ans = []
    ans1 = []
    cArr = []
    for sArr in orders:
        sArr = sorted(sArr) # 오더에 있는 문자열을 string 오름차순 정렬 -> 순열 방지
        cArr.append(list(sArr))

    combi = list()
    for num in course:
        for sArr in cArr:
            combi += combinations(sArr, num) # 나올 수 있는 모든 조합을 저장
    combi = sorted(combi) # 같은 조합의 개수를 빠르게 구하기 위해서 string 정렬
    # print(combi)
    
    tmp = combi[0] # 조합의 하나 하나를 저장
    cnt = 1 # 조합이 같을 때마다 +1
    rank = [0] * (course[-1] + 1) # 조합의 길이마다의 최대 개수
    for i in range(1, len(combi)):
        # tmp에서 값이 달라지면서 개수가 2개 이상일때만
        if tmp != combi[i] and cnt >= 2:
            ans1.append([cnt, tmp])
            # cnt가 현재 조합의 길이에서의 최대 값을 넘어서면 갱신
            if rank[len(tmp)] < cnt:
                rank[len(tmp)] = cnt
            tmp = combi[i]
            cnt = 1
            continue
        # 해당 조합이 1개 이하일 때
        elif tmp != combi[i]:
            tmp = combi[i]
            cnt = 1
            continue
        tmp = combi[i]
        cnt += 1
        # 마지막 인덱스에서 해당 조합의 길이에서 최대값이 나왔을 때 예외처리
        if i == len(combi) - 1 and rank[len(tmp)] <= cnt:
            rank[len(tmp)] = cnt
            ans1.append([cnt, tmp])
    # ans1 = sorted(ans1, key = lambda k : (-k[0], k))
    ans1 = sorted(ans1, reverse = 1) # 개수기준 내림차순 정렬
    # print(rank)
    # print(ans1)
    for i in range(len(ans1)):
        # 해당 조합 길이에서의 최대값이랑 같으면 저장 -> 같은 값이 여러 개 나올 수 있기 떄문
        if rank[len(ans1[i][1])] == ans1[i][0]:
            ans.append("".join(ans1[i][1]))
    return sorted(ans)

# print(solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4]))
# print(solution(["XYZ", "XWY", "WXA"], [2,3,4]))
# print(solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5]))
# print(solution(["ABCD", "ABCD", "ABCD"], [2,3,4]))
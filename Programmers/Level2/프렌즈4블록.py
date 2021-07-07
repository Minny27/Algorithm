# -*- coding: utf-8 -*-

# 프렌즈 4블록
# 시간 : 3시간
# 구현 아이디어 : 해시 + 단순 구현
# 11번 테스트 케이스에서 실패.. 질문하기에서의 예시를 다 돌려도 성공했고, 예시를 만들어서 진행해봤으나 11번 테스트케이스에서 실패했다....
# 1) 먼저 [알파벳 : 아스키코드], [아스키코드 : 알파벳] 형식의 해시 테이블 생성
# 2) 왼쪽 아래에서 오른쪽 위로가는 방식으로 모든 원소를 보면서 4블록의 왼쪽 아래를 기준으로 4개의 값을 비교
# 3) 비교해서 값이 같으면 알파벳에 해당하는 아스키 코드로 변환, 만약 이미 아스키코드이면 다시 알파벳으로 변환해서 비교
# 4) 다시 왼쪽 아래에서 오른쪽위로 가면서 알파벳일 때만 지워야하는 개수(tmp) 만큼 밑으로 스왑, 이미 지운 블록은 -1로 바꾸기
# 5) 스왑을 한 번이라도 했으면 check = 1
# 5) 2 ~ 5과정 반복, 스왑을 한 번도 하지 않으면 ans리턴
# 6) 중복된 값을 제거하기 위해서 아스키코드에서 알파벳으로 바꾼 횟수를 4에서 뺀 값을 ans에 더하기

# 행, 열 = m, n
def solution(m, n, board):
    bArr = [list(map(str, list(board[i]))) for i in range(m)]
    ans = 0 # 지워야하는 총 개수
    ht = {'-1' : '-1'}
    for i in range(26):
        ht[str(i)] = chr(65 + i)
        ht[chr(65 + i)] = str(i)
    while 1:
        check = 0
        # 지울 친구들 표시
        for j in range(n - 1):
            for i in range(m - 1, 0, -1):
                cnt = 4
                tmp1, tmp2, tmp3, tmp4 = bArr[i][j], bArr[i][j + 1], bArr[i - 1][j], bArr[i - 1][j + 1]
                if tmp1.isdigit(): 
                    tmp1 = ht[tmp1]
                    cnt -= 1
                if tmp2.isdigit(): 
                    tmp2 = ht[tmp2]
                    cnt -= 1
                if tmp3.isdigit(): 
                    tmp3 = ht[tmp3]
                    cnt -= 1
                if tmp4.isdigit(): 
                    tmp4 = ht[tmp4]
                    cnt -= 1
                if tmp1 == tmp2 == tmp3 == tmp4:
                    if tmp1 == '-1':
                        continue
                    v = ht[tmp1]
                    bArr[i][j], bArr[i][j + 1], bArr[i - 1][j], bArr[i - 1][j + 1] = v, v, v, v
                    ans += cnt
        # 0보다 작은 값(지울애들)이 있는 자리를 위에서 아래로 채워주기
        for j in range(n):
            tmp = 0 # 내려하는 캐릭터를 기준으로 밑으로 내려야하는 개수
            for i in range(m - 1, -1, -1):
                if bArr[i][j].isdigit():
                    tmp += 1
                else:
                    if bArr[i][j].isalpha():
                        for k in range(tmp):
                            bArr[i + 1 + k][j] = "-1"
                            bArr[i + 1 + k][j], bArr[i + k][j] = bArr[i + k][j], bArr[i + 1 + k][j]
                            check = 1
        if not check:
            return ans
# print(solution(4, 5, ["CCBDE", "AAADE", "AAABF", "CCBBF"]))
# print(solution(6, 6, ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"]))
# print(solution(3, 3, ["AAA", "AAA", "AAA"]))
# print(solution(7, 4, ["CCBB", "BBAA", "AAAA", "AAAA", "AAAA", "BBBB", "CCCC"]))
print(solution(7, 5, ["AADDE",
                      "DDCCE",
                      "AACCF",
                      "AADDF",
                      "DDBFF",
                      "AABBF",
                      "AABFF"]))
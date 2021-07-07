# -*- coding: utf-8 -*-

# 신규 아이디 추천
# 시간 : 1시간 40분
# 1번조건부터 차근차근 했다고 생각했지만... 뭔가 느리고 정확도도 떨어지는 느낌이다...
# #으로 1 ~ 7 조건을 일일이 쓰면서 하는 방식이 더 빨랐을 것 같다...
# 노력하자!!!.....

def cal(idArr):
    i = 0
    while i < len(idArr):
        if not idArr[i].isdigit() and not idArr[i].isalpha() and not idArr[i] == '-' and not idArr[i] == '_' and not idArr[i] == '.':
            del idArr[i]
            i -= 1
            while i > -1 and i == len(idArr) - 1 and idArr[i] == '.':
                del idArr[i]
                i -= 1
        elif i == 0 and idArr[i] == '.':
            del idArr[i]
            i -= 1
        elif i == len(idArr) - 1 and idArr[i] == '.':
            while idArr[i] == '.':
                del idArr[i]
                i -= 1
        elif idArr[i] == '.' and idArr[i - 1] == '.':
            del idArr[i]
            i -= 1
        else:
            {}
        i += 1
    return idArr

def solution(new_id):
    ans = ''
    new_id = new_id.lower()
    idArr = list(new_id)
    # print(idArr)
    idArr = cal(idArr)

    if not idArr:
        idArr.append('a')
    elif len(idArr) >= 16:
        idArr = list("".join(map(str, idArr[:15])).lower())
        cal(idArr)
    if len(idArr) == 1:
        idArr = idArr[0] * 3
    elif len(idArr) == 2:
        idArr.append(idArr[-1])
    ans = "".join(map(str, idArr))
    return ans

# print(solution("...!@BaT#*..y.abcdefghijklm"))
# print(solution("z-+.^."))
# print(solution("=.="))
# print(solution("123_.def"))
# print(solution("abcdefghijklmn.p"))
print(solution("b......@"))
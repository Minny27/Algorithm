# 문자열 다루기 기본
# 문제 설명
# 문자열 s의 길이가 4 혹은 6이고, 숫자로만 구성돼있는지 확인해주는 함수, solution을 완성하세요. 예를 들어 s가 a234이면 False를 리턴하고 1234라면 True를 리턴하면 됩니다.

# 제한 사항
# s는 길이 1 이상, 길이 8 이하인 문자열입니다.

# 길이가 맞지 않으면 false를 출력해야한다.....,,,,,
def solution(s):
    answer = True
    if (len(s) != 4) & (len(s) != 6):
        answer = False
        return answer

    for  i in s:
        if (i >= chr(97)) & (i<= chr(122)):
            answer = False
    return answer
# return str.isdecimal(i)
   

# 위의 코드가 되지 않아 밑을 시도 했지만, 똑같이 5,6번 테스트 코드가 실패했다.
# def solution(s):
#     answer = True
#     for number, i in enumerate(s):
#         if (i >= '0') & (i<= '9'):
#             continue
#         else:
#             answer = False
#     return answer

print(solution("a234"))
print(solution("1234"))
print(solution("a2345"))
print(solution("a34333"))
print(solution("a234323"))
print(solution("12"))
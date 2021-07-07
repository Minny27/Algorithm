
# 문자열을 list로 형 변환하려면 list(str)을 사용하면 된다.
def solution(s):
    s = list(s)
    s.sort(reverse = True)
    answer = ""
    for i in s:
        answer = answer + i
    return answer
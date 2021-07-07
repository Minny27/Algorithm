#문제 설명
#단어 s의 가운데 글자를 반환하는 함수, solution을 만들어 보세요. 단어의 길이가 짝수라면 가운데 두글자를 반환하면 됩니다.

#재한사항
#s는 길이가 1 이상, 100이하인 스트링입니다.

# 문자열의 길이가 짝수 홀수 일 때를 나누고 홀수는 가운데, 짝수는 중앙값을 기준으로 내림 올림값 출력
def solution(s):
    # if len(s) % 2 != 0:
    #     return s[int(len(s) / 2)]
    # else:
    #     return s[int(len(s) / 2) - 1] + s[int(len(s) / 2)]
    return s[(len(s)-1)//2:len(s)//2+1]

print(solution("abcde"))
print(solution("qwer"))

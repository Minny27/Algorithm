
# 한 줄 코딩
def string_middle(str):
    # 함수를 완성하세요

    return str[(len(str)-1)//2:len(str)//2+1]

# 아래는 테스트로 출력해 보기 위한 코드입니다.
print(string_middle("power"))

# '-'를 이용
def string_middle(str):
    a = len(str)
    if a % 2 == 0 :
        a = (a-2) / 2
    else :
        a = (a-1) / 2
    return str[int(a) : -int(a)]
# 아래는 테스트로 출력해 보기 위한 코드입니다.
print(string_middle("power"))
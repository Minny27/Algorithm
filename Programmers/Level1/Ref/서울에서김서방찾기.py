
# index함수 활용
def findKim(seoul):
    return "김서방은 {}에 있다".format(seoul.index('Kim'))


# 실행을 위한 테스트코드입니다.
print(findKim(["Queen", "Tod", "Kim"]))


# "김이 들어가는 문자열을 인덱스에서 바로 찾기"
def findKim(seoul):
    kimIdx = 0
    # 함수를 완성하세요
    for i in range(len(seoul)):
        if seoul[i]=="Kim":
            return "김서방은 {}에 있다".format(i)

# 실행을 위한 테스트코드입니다.
print(findKim(["Queen", "Tod", "Kim"]))
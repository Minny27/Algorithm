def solution(seoul):
    answer = ''

    for i in range((len(seoul))):
        if (len(seoul[i]) != 3) & (seoul[i][0] != 'K'):
            continue

        if seoul[i][1] != 'i':
            continue

        if seoul[i][2] != 'm':
            continue
        else:
            answer = "김서방은 {0}에 있다.".format(i)
        
    return answer
print(solution(["Queen", "Tod", "Kim"]))

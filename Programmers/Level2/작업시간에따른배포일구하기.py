def solution(progresses, speeds):
    day = 0  # 걸리는 시간
    count = 0  # 배포
    answer = []
    while len(progresses) > 0:
        if (progresses[0] + speeds[0] * day) >= 100:
            progresses.pop(0)
            speeds.pop(0)
            count += 1
        else:
            if count > 0:
                answer.append(count)
                count = 0
                day += 1
    answer.append(count)
    return answer

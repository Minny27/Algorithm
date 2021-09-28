# 디스크 컨트롤러
# 사간: 3시간

from heapq import heappush, heappop

def solution(jobs):
    ans = 0
    hq = []
    index = 0
    now = 0
    jobs.sort()
    while index < len(jobs) or hq:
        if index < len(jobs) and now >= jobs[index][0]:
            heappush(hq, [jobs[index][1], jobs[index][0]])
            index += 1
            continue
        if hq:
            task = heappop(hq)
            ans += now - task[1] + task[0]
            now += task[0]
            continue
        else:
            now = jobs[index][0]

    return int(ans / len(jobs))

print(solution([[0, 3], [1, 9], [2, 6]])) # 9
print(solution([[0, 9], [1, 3], [15, 4]])) # 8
print(solution([[0, 3], [3, 3], [6, 3]])) # 3
print(solution([[24, 10], [28, 39], [43, 20], [37, 5], [47, 22], [20, 47], [15, 34], [15, 2], [35, 43], [26, 1]])) # 72
print(solution([[0, 10], [2, 10], [9, 10], [15, 2]])) # 14
print(solution([[0, 10], [2, 12], [9, 19], [15, 17]])) # 25
print(solution([[0, 1]])) # 1
print(solution([[0, 1], [0, 1], [0, 1]])) # 2
print(solution([[0, 3], [1, 9], [2, 6], [30, 3]])) # 7
def solution(array, commands):
    answer = []
    array_copy = []

    # z는 열, i, j, k 는 리스트의 0 , 1, 2번째 인덱스
    for z in range(0, 3):
        i = commands[z][0]
        j = commands[z][1]
        k = commands[z][2]
        array_copy = array[i-1:j]
        array_copy.sort()
        answer.append(array_copy[k-1])
    return answer
print(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]))
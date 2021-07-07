# 해쉬를 이용해서 참가자 중 완주하지 못한 한 명 리턴하기

# 알고리즘 : 참가자와 완주자를 오름차순 정렬 후 중첩 for문을 통해서 두 리스트의 값이 같으면 지우고 for문이 끝나고 남은 0번쨰 인덱스를 return
# def solution(participant, completion):
#     answer = ''
#     sorted(participant)
#     sorted(completion)

#     while len(completion) > 0:
#         for i in participant:
#             for j in completion:
#                 if i == j:
#                     participant.remove(i)
#                     completion.remove(j)
#     answer = participant[0]

#     return answer
# print(solution(["leo", "kiki", "eden"], ["eden", "kiki"]))
# print(solution(["marina", "josipa", "nikola", "vinko", "filipa"], ["josipa", "filipa", "marina", "nikola"]))
# print(solution(["mislav", "stanko", "mislav", "ana"], ["stanko", "ana", "mislav"]))

def solution(participant, completion):
    answer = ''
    participant.sort()
    completion.sort()
    i = 0

    # print(participant)
    # print(completion)

    while i < len(completion):
        if participant[i] == completion[0]:
            participant.remove(participant[i])
            completion.remove(completion[0])
        else:
            i += 1

    answer = participant[0]
    return answer


print(solution(["leo", "kiki", "eden"], ["eden", "kiki"]))
print(solution(["marina", "josipa", "nikola", "vinko", "filipa"], ["josipa", "filipa", "marina", "nikola"]))
print(solution(["mislav", "stanko", "mislav", "ana"], ["stanko", "ana", "mislav"]))
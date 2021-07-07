
# -*- coding: utf-8 -*-

# 순위 검색
# 시간 : 1시간 반
# 처음에는 주먹구구식으로 구현을 하려다가 약 O(4 * 50000 * 100000)의 시간 복잡도 때문에 해시로 생각
# 1) query의 조건들의 첫 글자만따서 해시 키를 설정하고 각 조합마다 인덱스를 부여하기
# 2) 쿼리문마다 첫 글자들을 더해서 해시 값을 얻고, 그 해시 값을 인덱스로하여 infoArr에 점수를 append하기
# 3) 쿼리문에 해당하는 인덱스 값(infoArr[i])에 저장된 점수들을 query의 점수와 비교해서 큰 값들의 개수를 total에 더하고 ans에 append


def solution(info, query):
    ans = []
    a = ['jbjp', 'jbjc', 'jbsp', 'jbsc', 'jfjp', 'jfjc', 'jfsp', 'jfsc', 'pbjp','pbjc', 'pbsp', 'pbsc', 'pfjp', 'pfjc', 'pfsp', 'pfsc', 'cbjp', 'cbjc', 'cbsp', 'cpsc', 'cfjp', 'cfjc', 'cfsp', 'cfsc']
    ht = {} # {나올수 있는 조합 : 인덱스}
    for i in range(len(a)):
        ht[a[i]] = i
    # print(ht)
    infoArr = [[] for _ in range(24)] # 나올 수 있는 조합에서의 점수
    for data in info:
        dataArr = data.split()
        pre = dataArr[0][0] + dataArr[1][0] + dataArr[2][0] + dataArr[3][0] # 각 스트링의 첫 번째 글자만 따서 조합을 만들기
        infoArr[ht[pre]].append(int(dataArr[4])) # 해당하는 조합에 점수 넣기
    # print(infoArr)
    for words in query:
        tmp = words.split()
        wArr = [tmp[0], tmp[2], tmp[4], tmp[6], tmp[7]]
        pre = wArr[0][0] + wArr[1][0] + wArr[2][0] + wArr[3][0]
        # print(pre)
        arr = set()
        hypencnt = 0
        check = 0
        if pre.find('-') > -1:
            for k, v in ht.items():
                if check == 1:
                    break
                for idx in range(4):
                    if idx == 3 and pre[idx] == '-':
                            arr.add(k)
                    elif pre[idx] == '-':
                        hypencnt += 1
                        if hypencnt == 4:
                            for k in ht.keys():
                                arr.add(k)
                        continue
                    elif pre[idx] != k[idx]:
                        break
                    elif idx == 3 and pre[idx] == k[idx]:
                        arr.add(k)

            cnt = 0
            # print(arr)
            for s in arr:
                for value in infoArr[ht[s]]:
                    if value >= int(wArr[4]):
                        cnt += 1
            ans.append(cnt)
        else:           
            cnt = 0
            # print(pre)
            for value in infoArr[ht[pre]]:
                # print(value, wArr[4])
                if value >= int(wArr[4]):
                    cnt += 1
            ans.append(cnt)
        print(arr)
    # print(ans)
    return ans

print(solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]))
print(solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]))
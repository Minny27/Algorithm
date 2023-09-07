// 호텔 대실
// 문제 유형: 정렬, 그리디
// 문제 해석: 백준의 회의실 배정과 비슷해서 풀만하다고 생각했각했었음..
// 그런데 예약 끝시간을 기준으로 오름차순 정렬을 했었는데 이게 패착이었음..
// 이것 때문에 뭐가 틀렸는지 전혀 모르고 시간을 허비했음...
// 왜 이 문제는 시작 시간 오름차순 정렬을 해야할까??
// 이 이유를 잘 모르겠음.. 반례도 못찾겠음...
// 시작 시간 오름차순 정렬된 book_time 하나씩 꺼내면서 endTimes에 있는 endTime 보다 크면 값을 갱신하고,
// endTime이 작으면 endTimes array에 추가하는 방식으로 구현
// 결과는 endTimes array의 길이를 리턴

import Foundation

func solution(_ book_time:[[String]]) -> Int {
    // 시간 문자열을 분 정수형으로 변환 및 시작 시간 오름차순 정렬
    let bookTimes = book_time.map { time in
        [hToM(time[0]), hToM(time[1])]
    }.sorted(by: { $0[0] < $1[0] })
    
    // book_time의 시작 시간 + 청소시간 값과 endTimes에 있는 모든 값을 비교해서 끝 값을 갱신 혹은 추가하는 array
    var endTimes = [Int]()
    for bookTime in bookTimes {
        if endTimes.isEmpty {
            endTimes.append(bookTime[1])
            continue
        }
        
        let (bS, bE) = (bookTime[0], bookTime[1])
        // 모든 endTimes를 확인해서 끝 값 + 청소시간보다 작은 값은 추가하기 위한 bool 값
        var flag = true
        
        for i in 0..<endTimes.count {
            if endTimes[i] + 10 <= bS {
                endTimes[i] = bE
                flag = false
                break
            }
        }
        
        if flag {
            endTimes.append(bE)
        }
    }
    
    return endTimes.count
}

func hToM(_ h: String) -> Int {
    let split = h.components(separatedBy: ":")
    let h = (Int(split[0]) ?? 0) * 60
    let m = Int(split[1]) ?? 0
    return h + m
}
//
//print(solution([["10:00", "13:00"], ["13:10", "15:00"], ["15:10", "17:00"], ["17:10", "21:20"]])) // 1
//
//print(solution([["15:00", "17:00"], ["17:00", "19:00"]])) // 2
//print(solution([["08:00", "08:30"], ["08:00", "13:00"], ["12:30", "13:30"]])) // 2
//print(solution([["00:01","00:10"],["00:19","00:29"]] )) // 2
//print(solution([["09:10", "10:10"], ["09:10", "10:10"], ["10:20", "12:20"], ["10:20", "12:20"]])) // 2


print(solution([["12:00", "14:00"],
                ["14:10", "14:20"],
                ["13:10", "15:00"],
                ["10:10", "16:00"],
                ["15:10", "21:20"]]))
//print(solution([["10:10", "16:00"],
//               ["11:00", "14:00"],
//               ["12:00", "13:00"],
//               ["14:00", "15:00"],
//               ["15:00", "21:20"]]))

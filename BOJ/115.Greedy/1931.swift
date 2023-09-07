// 회의실 배정
// 문제 유형: 그리디, 정렬
// 이전에 파이썬으로 풀었었는데 프로그래머스에서 이와 비슷한 문제를 접했음.
// 그런데 다시봐도 왜 이렇게 풀었는지 이해가 안 됐음..
// 정렬을 할 때 끝시간 오름 차순 후, 시작 시간 오름 차순 정렬을 해야 함.
// 그 이유는 끝시간을 기준으로 오름차순으로 정렬해야 이전 강의의 끝 시간을 기준으로 다음 강의의 시작 시간과 비교해서 끝시간을 갱신할 수 있음.
// 또한 시작 시간 오름 차순까지 정렬을 해야하는 이유는 강의 시작 시간이 큰 것부터 계산하게 되면 작은 것이 포함되지 않을 수 있기 때문
// 반례 예시
// 5
// 1 2
// 5 9
// 7 11
// 13 13
// 12 13
// 답은 4가 나와야하나 3이 나옴

import Foundation

let n = Int(readLine()!)!

print(solution())

func solution() -> Int {
    let array = input()
    var answer = 0
    var s = -1
    
    // 이전 강의의 끝 시간보다 다음 강의 시작 시간이 더 클 때만 그 시간의 끝시간으로 갱신 후, answer += 1
    for time in array {
        if time[0] >= s {
            s = time[1]
            answer += 1
        }
    }
    return answer
}

func input() -> [[Int]] {
    var newArray = [[Int]]()
    for _ in 0..<n {
        let split = readLine()!.components(separatedBy: " ").map { Int($0)! }
        newArray.append([split[0], split[1]])
    }
    // 끝시간 오름차순으로 정렬 후, 시작 시간 오름차순 정렬
    newArray.sort(by: { ($0[1], $0[0]) < ($1[1], $1[0]) })
    return newArray
}

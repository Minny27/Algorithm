// 과일 장수
// 문제 유형: 정렬, 구현
// 처음에는 For문으로 모든 인덱스를 체크했는데
// 다른 풀이를 보니 stride 시퀀스를 recude로 리턴방식으로 구현할 수 있다는 것을 알았음.

import Foundation

// 최종
func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    let score = score.sorted { $0 > $1 }
    return stride(from: m-1, to: score.count, by: m)
        .reduce(0, { $0 + score[$1] * m })
}

// 업그레이드
//func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
//    var answer = 0
//    let score = score.sorted { $0 > $1 }
//
//    for i in stride(from: m - 1, to: score.count, by: m) {
//        answer += score[i] * m
//    }
//    return answer
//}

// 처음 코드
//func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
//    var answer = 0
//    let score = score.sorted { $0 > $1 }
//
//    for i in 0..<score.count {
//        if score[i] % m == m - 1 {
//            answer += score[i] * m
//        }
//    }
//    return answer
//}

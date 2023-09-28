// 내적
// 문제 유형: 구현
// zip과 map 함수를 쓸 수 있구나... 배워갑니다

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var answer = 0
    for i in 0..<a.count {
        answer += a[i]*b[i]
    }
    return answer
}

// 다른 사람 풀이
// import Foundation

// func solution(_ a:[Int], _ b:[Int]) -> Int {
//     return zip(a, b).map(*).reduce(0, +)
// }
// 푸드 파이터 대회
// 문제 유형: 문자열, 구현
// 화이팅!!

import Foundation

func solution(_ food:[Int]) -> String {
    var answer = ""
    for i in 0..<food.count {
        answer += Array(repeating: String(i), count: food[i] / 2).joined()
    }    
    return answer + "0" + answer.reversed()
}

// 이전 풀이
// func solution(_ food:[Int]) -> String {
//     var answer = ""
//     for i in 0..<food.count {
//         var n = food[i] / 2
//         while n > 0 {
//             answer += String(i)
//             n -= 1
//         }
//     }
    
//     return answer + "0" + answer.reversed()
// }
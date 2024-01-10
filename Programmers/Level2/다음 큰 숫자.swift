// 다음 큰 숫자
// 문제 유형: 수학
// 느낀점: nonzeroBitCount 프로퍼티를 알게 되었다?!

import Foundation

func solution(_ n:Int) -> Int {
    var answer = n+1
    
    while true {
        if n.nonzeroBitCount == answer.nonzeroBitCount {
            break
        }
        answer += 1
    }
    return answer
}


// 이전 코드
// func solution(_ n:Int) -> Int {
//     var answer = 0
//     let oneCount = String(n, radix: 2).filter({ $0 == "1" }).count
    
//     for i in n+1...1000000 {
//         if oneCount == String(i, radix: 2).filter({ $0 == "1" }).count {
//             answer = i
//             break
//         }
//     }
//     return answer
// }
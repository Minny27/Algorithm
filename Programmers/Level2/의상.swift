// 의상
// 문제 유형: 수학 or DP, 해시
// 느낀점: 경우의 수를 찾는 방식을 계속 연습하자!!!
// 풀이 방법: 경우의 수를 하나씩 구해보기
// Key가 하나일 때, a
// Key가 2개일 때, a + b + ab
// Key가 3개일 때, a + b + c + ab + bc + ca + abc
// => (a+1)(b+1) -1 과 같은 공식이 발견됨.
// 이를 구현

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dict = [String: Int]()
    var answer = 1
    
    for c in clothes {
        let (_, type) = (c[0], c[1])
        dict[type, default: 0] += 1
    }
    
    return dict.values.reduce(1) { $0 * ($1 + 1) } - 1
}

// 이전 풀이
// import Foundation

// func solution(_ clothes:[[String]]) -> Int {
//     var dict = [String: Int]()
//     var answer = 0
    
//     for c in clothes {
//         let (_, type) = (c[0], c[1])
//         dict[type, default: 0] += 1
//     }
    
//     for n in 1...dict.keys.count {
//         let values = Array(dict.values)
//         for i in 0..<dict.keys.count {
//             var sum = 1
//             if values.count - i < n { continue }
//             for j in i..<i+n where i + n <= values.count {
//                 sum *= values[j]
//             }
//             answer += sum
//         }
//     }
    
//     return answer
// }
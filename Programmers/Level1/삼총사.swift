// 삼총사
// 문제 유형: 구현
// 1000의 세제곱을 하면 10억이 되서 O(n^3)으로 구현하면 안 된다고 생각했는데..
// 패착이었음... 투포인터로 생각한 내가..
// 투포인터로 구현했더라도 O(n^3)이 되는 것 같음..

import Foundation

func solution(_ number:[Int]) -> Int {
    var answer = 0
    
    for i in 0..<number.count-2 {
        for j in i+1..<number.count-1 {
            for k in j+1..<number.count {
                if number[i] + number[j] + number[k] == 0 {
                    answer += 1
                }
            }
        }
    }
    
    return answer
}

// 이전 풀이
// func solution(_ number:[Int]) -> Int {
//     let number = number.sorted(by: <)
//     var answer = 0
    
//     for i in 0..<number.count-2 {
//         var s = i + 1
//         var e = i + 2
//         var sum = number[i]
//         while s < number.count-1 && e < number.count {
//             var tmp = sum + number[s] + number[e]
//             if tmp == 0 {
//                 sum = tmp
//                 answer += 1
//             } else {
//                 if sum > tmp  {
//                     tmp -= number[s]
//                     sum = tmp
//                     s += 1
//                 } else {
//                     tmp -= number[e]
//                     sum = tmp
//                     e += 1
//                 }
//             }
//         }
//     }
    
//     return answer
// }

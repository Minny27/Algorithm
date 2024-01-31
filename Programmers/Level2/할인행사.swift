// 할인행사
// 문제 유형: 투포인터, Dictionary
// 느낀점: 문제 이해를 잘못했었음.. 연속합이라는 것을 간과하고 subSum을 구해야한다고 생각함...
// 풀이 방법: 투포인터(s, e)로 10개까지 쌓이면 앞을 없에고 뒤를 늘리는 방식으로 구현
// 이때, 앞을 없애거나 뒤를 늘릴 때나 현재 위치+1을 해주고, 값을 빼주거나 더해줘야함
// 그리고 한 번의 시행이 끝났을 때마다 딕셔너리에 있는 모든 값이 0인지를 확인하고 0이면 answer += 1
// allSatisfy로 모든 값이 동일한 지에 대한 유무 체크
// 처음에는 values의 값들을 reduce로 더해서 0이면 answer를 증가시켰는데.. -1, 1도 0이 된다는 것을 간과함..

import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var dict = Dictionary(uniqueKeysWithValues: zip(want, number))
    var (s,e) = (0,0)
    var count = 1
    var answer = 0
    
    while e < discount.count {
        if count <= 10 {
            let next = discount[e]
            if let _ = dict[next] { dict[next, default: 0] -= 1 }
            e += 1
            count += 1
        } else {
            let past = discount[s]
            if let _ = dict[past] { dict[past, default: 0] += 1 }
            s += 1
            count -= 1
        }
        if dict.values.allSatisfy { $0 == 0 } { answer += 1 }
    }
    return answer
}

// 이전 풀이2
// func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
//     var dict = Dictionary(uniqueKeysWithValues: zip(want, number))
//     var (s,e) = (0,0)
//     var count = 1
//     var answer = 0
    
//     while e < discount.count {
//         if count <= 10 {
//             let next = discount[e]
//             if let _ = dict[next] { dict[next, default: 0] -= 1 }
//             e += 1
//             count += 1
//         } else {
//             let past = discount[s]
//             if let _ = dict[past] { dict[past, default: 0] += 1 }
//             s += 1
//             count -= 1
//         }
//         if dict.values.reduce(0, +) == 0 { answer += 1 }
//     }
//     return answer
// }

// // 이전 풀이1
// func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
//     var dict = Dictionary(uniqueKeysWithValues: zip(want, number))
//     var (s, e) = (0, 0)
//     var answer = 0
//     var count = 0
    
//     while s <= e && s < discount.count && e < discount.count {
//         let k = discount[e]
//         count += 1
        
//         if let v = dict[k], count <= 10 {
//             dict[k]! -= 1 
//             e += 1   
//             if v < 0 {
//                 dict[k]! += 1 
//                 s += 1      
//             }
//         } else if count > 10 {
//             let past = discount[s]
//             if let v = dict[past] {
//                 dict[past]! += 1
//             }
//             s += 1
//             count -= 1
//         } else {
//             if s <= e {
//                 e + 1
//                 s = e
//             }
//             else { s += 1 }
//         }
        
//         if dict.values.reduce(0, +) == 0 { answer += 1 }
//     }
    
//     return answer
// }
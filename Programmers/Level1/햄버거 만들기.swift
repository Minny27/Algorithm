// 햄버거 만들기
// 문제 유형: Queue
// 아니 문제를.. 잘 못 이해함 야채나 고기가 여러 겹이어도 무시한다고 생각함..
// 개인적으로 불친절했다고 봄..

import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var answer = 0
    var queue = [Int]()
    
    for v in ingredient {
        queue.append(v)
        
        if queue.count >= 4 {
            let suf = queue.suffix(4)
            if suf == [1,2,3,1] {
                answer += 1
                queue.removeLast(4)
            }
        }
    }
    
    return answer
}



// 이전 풀이
// func solution(_ ingredient:[Int]) -> Int {
//     var answer = 0
//     var queue = [Int]()
    
//     for v in ingredient {
//         queue.append(v)
        
//         if queue.count >= 4 {
//             if queue[queue.count - 1] == 1 &&
//             queue[queue.count - 2] == 3 &&
//             queue[queue.count - 3] == 2 &&
//             queue[queue.count - 4] == 1 {
//                 answer += 1
//                 queue.removeLast()
//                 queue.removeLast()
//                 queue.removeLast()
//                 queue.removeLast()
//             }
//         }
//     }
    
//     return answer
// }

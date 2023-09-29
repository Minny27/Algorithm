// 약수의 개수와 덧셈
// 문제 유형: 수학
// 다른 사람의 풀이를 보니 어마어마하다...

import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var arr = [Int]()
    
    for i in left...right {
        var count = 0
        
        for j in 1..<Int(sqrt(Double(i))+1) {
            if i % j == 0 {
                count += 1
                if j*j != i {
                    count += 1
                }
            }
        }
        if count % 2 == 0 { arr.append(i) }
        else { arr.append(-i)}
    }
    
    return arr.reduce(0, +)
}

// 다른 사람 풀이
// func solution(_ left: Int, _ right: Int) -> Int {
//     return (left...right).map { i in (1...i).filter { i % $0 == 0 }.count % 2 == 0 ? i : -i }.reduce(0, +)
// }
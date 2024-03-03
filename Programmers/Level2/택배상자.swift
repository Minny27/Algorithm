// 택배상자
// 문제 유형: Stack, 그리디
// 느낀점: 처음에는 1부터 order.count까지 값을 다 넣고 cursor로 비교를 했었는데 종료 조건을 처리하기 힘들었음..
// 그리디 문제를 좀 더 많이 풀어봐야 할 듯..
// 풀이 방법: 일단 배열의 길이가 1,000,000이기 때문에, O(n)으로 풀어야 함
// 컨베이어 벨트에서 stack을 써야한다고 생각했고, 이 때도 마지막부터 넣고 마지막을 지우는 방식으로 구현
// 이유는 removeFirst()를 쓰면 O(n^2)가까이 될 수 있음
// 이 문제의 포인트는 상자의 번호가 순차적으로 놓여있다는 점
// number라는 변수를 만들어서 order를 순회하면서 order[i]보다 작거나 같을 때까지 stack에 값을 쌓고 number += 1
// 이렇게 할 수 있는 이유는 해당 상자를 뺄 때, 해당 상자 이전까지 -1번까지의 상자를 stack이 포함하고 있을 것이기 때문
// 그래서 stack에 있는 마지막 값과 order[i]가 같으면 stack.removeLast()후, answer += 1

import Foundation

func solution(_ order:[Int]) -> Int {
    var stack = [Int]()
    var number = 1
    var answer = 0
    
    for i in 0..<order.count {
        while number <= order[i] {
            stack.append(number)
            number += 1
        }
        
        if stack.last == order[i] { 
            stack.removeLast()
            answer += 1
        } else {
            break
        }
    }
    
    return answer
}

// 이전 풀이
// import Foundation

// func solution(_ order:[Int]) -> Int {
//     var list = Array(Range(1...order.count))
//     var stack = [Int]()
//     var answer = 0
    
//     var i = 0
//     var j = 0
//     while i < order.count && j < list.count {
//         if order[i] == list[j] { 
//             answer += 1
//             i += 1
//             j += 1
//         }
        
//         while true {
//             if !stack.isEmpty && stack.last == order[i] {
//                 i += 1
//                 stack.removeLast()
//                 answer += 1 
                
//                 if i >= order.count { break }
//             } else { 
//                 if j >= order.count { break }
//                 stack.append(list[j])
//                 j += 1
//             }
//         }
//     }
    
//     return answer
// }
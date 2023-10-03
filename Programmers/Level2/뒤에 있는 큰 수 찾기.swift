// 뒤에 있는 큰 수 찾기
// 문제 유형: 스택
// 아이디어가 생각보다 어려웠음.. 왜 난 binary search를 생각했을까..
// stack에 [인덱스, 값]을 저장할 2차원 array를 정의
// 순회하는 number 값보다 작으면 stack의 마지막 값의 인덱스에 number를 할당하기 위함 
// stack에 값이 있으면서 순회하는 number 값을 기준으로 stack의 끝 값부터 순회하면서 키가 작으면 removeLast()하고
// 스택의 마지막 값의 인덱스에 number를 할당 => answer[item[0]] = numbers[i]
// numbers를 반복하면서 stack에 값을 append

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var stack = [[Int]]()
    var answer = Array(repeating: -1, count: numbers.count)
    
    for i in 0..<numbers.count {
        while !stack.isEmpty && stack.last![1] < numbers[i] {
            let item = stack.removeLast()
            answer[item[0]] = numbers[i]
        }
        stack.append([i, numbers[i]])
    }
    return answer
}

// 오답 코드
// func solution(_ numbers:[Int]) -> [Int] {
//     let array = numbers.enumerated().map { [$1, $0] }.sorted { $0[0] < $1[0] }
//     var answer = [Int]()
    
//     func binarySearch(_ array: [[Int]], _ target: Int) -> Int {
//         var l = 0
//         var r = array.count - 1
        
//         while l <= r {
//             let m = (l + r) / 2
            
//             if array[m][0] == target {
//                 return m
//             } else if array[m][0] < target {
//                 l = m + 1
//             } else {
//                 r = m - 1
//             }
//         }
//         return r
//     }
    
//     for (i,n) in numbers.enumerated() {
//         let location = binarySearch(array, n)
//         if location + 1 == array.count {
//             answer.append(-1)
//         } else {
//             for j in location+1..<array.count {
//                 if n != array[j][0] && count < array[j][1] {
//                     answer.append(array[j][1])
//                     break
//                 }
                
//                 if j == array.count - 1  {
//                     answer.append(-1)    
//                     break
//                 }
//             }
//         }
//     }
//     return answer
// }
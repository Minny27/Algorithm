// 괄호 회전하기
// 문제 유형: Stack
// 느낀점: 최악의 경우, 시간 복잡도가 O(n^3)으로 잘못판단했음.. 그리고 왼쪽 괄호만 나왔을 때의 경우를 체크하지 못함..
// 풀이 방법: 문자열을 순회하면서 한 번의 시행 때마다 오른쪽 괄호를 첫 번째 위치에 insert하는 방식으로 구현
// 문자열 옮기기 n * n개의 문자열 확인 * n번의 시행으로 O(n^3)이 나온다고 판단한 것이 미스였음.
// 문자열을 옮기는 것과 n개의 문자열을 확인하는 것을 독립적이므로 곱셈이 아님..

import Foundation

func solution(_ s:String) -> Int {
    var ss = Array(s).map { String($0) }
    var answer = 0
    
    for i in 0..<s.count {
        var isComplete = true
        var stack = [String]()
        for s in ss {
            if s == "{" || s == "[" || s == "(" {
                stack.append(s)
            } else {
                if stack.isEmpty {
                    isComplete = false
                    break
                } else {
                    let tmp = stack.popLast()!
                    if s == "}" && tmp == "{" { continue }
                    if s == "]" && tmp == "[" { continue }
                    if s == ")" && tmp == "(" { continue }
                    isComplete = false
                    break
                }
            }
        }
        
        if let v = ss.popLast() { ss.insert(v, at: 0) }
        if stack.isEmpty && isComplete { answer += 1 }
    }
    
    return answer
}

// 이전 풀이
// func solution(_ s:String) -> Int {
//     var ss = Array(s).map { String($0) }
//     var es = [String]()
//     var answer = 0
    
//     for i in 0..<s.count {
//         var isComplete = true
//         var stack = [String]()
//         for s in es.reversed() {
//             if s == "{" || s == "[" || s == "(" {
//                 stack.append(s)
//             } else {
//                 if stack.isEmpty {
//                     isComplete = false
//                     break
//                 } else {
//                     let tmp = stack.popLast()!
//                     if s == "}" && tmp == "{" { continue }
//                     if s == "]" && tmp == "[" { continue }
//                     if s == ")" && tmp == "(" { continue }
//                     isComplete = false
//                     break
//                 }
//             }
//         }
        
//         for s in ss {
//             if !isComplete { break }
            
//             if s == "{" || s == "[" || s == "(" {
//                 stack.append(s)
//             } else {
//                 if stack.isEmpty {
//                     isComplete = false
//                     break
//                 } else {
//                     let tmp = stack.popLast()!
//                     if s == "}" && tmp == "{" { continue }
//                     if s == "]" && tmp == "[" { continue }
//                     if s == ")" && tmp == "(" { continue }
//                     isComplete = false
//                     break
//                 }
//             }
//         }
        
//         if let v = ss.popLast() { es.append(v) }
//         if stack.isEmpty && isComplete { answer += 1 }
//     }
    
//     return answer
// }
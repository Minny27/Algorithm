// 옹알이 (2)
// 문제 유형: 문자열
// swift에서의 문자열.. 쉽지 않다
// 생각보다 어려웠던 거 같음.
// 처음에는 순열이라고 생각해서 모든 경우의 수를 dict에 담고 count를 더해서 리턴하는 방식으로 생각했는데
// 중복 순열의 개념이었고, 같은 문자열이 연속해서 나오는 경우만 제외한다고 하더라도
// 최대 문자열 길이 30인이고, 최소 문자열 길이(ye)가 2인걸 감암했을 때,
// 중복과 순서를 고려해서 4개 중 15개를 뽑는 경우의 수 4의 15제곱 == 2의 30제곱 == 21억의 경우의수,,,
// 경우의 수를 모두 구한다는 생각으로 접근하면 안 됐을 문제..
// 그래서 파이썬으로 구현한 다른 풀이를 참고
// 한 문자열이 연속으로 나오는 경우의 수를 제외하고 babbling의 각각의 문자열에 포함된 word를 " "로 대체
// 그리고 대체한 문자열이 " "로만 이루어진 경우에만 answer += 1
// 여기서 "" 빈 값으로 하지 않는 이유는 ""처리를 하고나서 합쳤을 때 다시 word가 될 수 있기 때문

import Foundation

func solution(_ babbling:[String]) -> Int {
    var babbling = babbling
    let words = ["aya", "ye", "woo", "ma"]
    var answer = 0

    for (i,k) in babbling.enumerated() {
        for word in words {
            if k.contains(word+word) { break }
            // 문자열 array의 문자열에서 word를 " "로 대체
            babbling[i] = babbling[i].replacingOccurrences(of: word, with: " ")
        }
        // 문자열 array의 문자열에서 모든 문자열이 " "로 이루어져 있으면 answer += 1
        if babbling[i].allSatisfy({ $0 == " " }) { answer += 1 }
    }
    return answer
}

// 이전 풀이
// func solution(_ babbling:[String]) -> Int {
//     let words = ["aya", "ye", "woo", "ma"]
//     var dict = [String: Int]()
//     var visited = Array(repeating: false, count: 4)
    
//     func dfs(_ count: Int, _ total: Int, _ arr: [String]) {
//         if count == total {
//             dict[arr.joined()] = 0
//             return
//         }
        
//         for i in 0..<4 {
//             if visited[i] { continue }
//             visited[i] = true
//             var arr = arr
//             arr.append(words[i])
//             dfs(count + 1, total, arr)
//             visited[i] = false
//         }
//     }
    
//     for i in 1...4 {
//         visited = Array(repeating: false, count: 4)
//         dfs(0, i, [])
//     }
    
//     for k in babbling {
//         if let v = dict[k] {
//             dict[k]! += 1
//         }
//     }
    
//     return dict.values.reduce(0, {$0+$1})
// }

// print(solution(["aya"])) // 1
// print(solution(["yeaya","ayayewooma"])) // 2
// print(solution(["wooo"])) // 0
// print(solution(["ayaaya"])) // 0
// print(solution(["woowo"])) // 0
// print(solution(["aya","aya"])) // 2
// print(solution(["aya", "yee", "u", "maa"])) // 1
// print(solution(["aya", "yee", "u"])) // 1


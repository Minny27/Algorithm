// 점프와 순간 이동
// 문제 유형: 구현
// 느낀점: 왜 최단거리라고 생각했을까.. BFS는 시간초과가 나거늘...
// 10억 이하의 수였다는 것을 간과했다..
// 시작점에서 하면 4 -> 5, 4 -> 6의 시행이 +1, -1를 해야하기 때문에 n에서 시작해서 짝수이면 2로 나누고
// 홀수 이면 -1하는 방식으로 처리하는 것이 맞는 방법...
// 구현 문제를 더 많이 풀어봐야 할 것.

import Foundation

func solution(_ n:Int) -> Int {
    var answer: Int = 0
    
    var c = n
    while c > 0 {
        if c % 2 == 0 {
            c /= 2
        } else {
            c -= 1
            answer += 1
        }
    }
    return answer
}

// 이전 BFS 시간초과 풀이
// import Foundation

// func solution(_ n:Int) -> Int {
//     var ans: Int = 1
    
//     var q = [[1,1]]
//     var visited = Array(repeating: false, count: n+1)
    
//     while !q.isEmpty {
//         let f = q.removeFirst()
//         let (v, c) = (f[0], f[1])
//         visited[v] = true
        
//         for nv in [v * 2, v + 1] {            
//             if nv > n || visited[nv] { continue }
//             if nv == v * 2 {
//                 if nv == n { return c }
//                 q.append([nv, c])
//             }
            
//             else { 
//                 if nv == n { return c + 1 }
//                 q.append([nv, c+1])
//             }
//         }
//     }
    
//     return ans
// }
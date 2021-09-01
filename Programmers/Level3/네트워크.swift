// 네트워크
// 시간 : 40분

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = Array(repeating: Bool(), count: n)
    var ans = 0

    func dfs(_ node: Int) -> Int {
        if visited[node] == true {
            return 0
        }
        visited[node] = true
        for adj in 0..<n {
            if computers[node][adj] == 1 {
                dfs(adj)
            }
        }
        
        return 1
    }
    
    for i in 0..<n {
        if !visited[i] {
            ans += dfs(i)
        }
    }
    
    return ans
}

// func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
//     var g = Array(repeating: [Int](), count: n)
//     var visited = Array(repeating: Bool(), count: n)
//     var ans = 0
    
//     for i in 0..<n {
//         for j in 0..<n {
//             if i == j {
//                 continue
//             }
//             if computers[i][j] == 1{
//                 g[i].append(j)
//             }
//         }
//     }
    
//     func dfs(_ node: Int) -> Int {
//         if visited[node] == true {
//             return 0
//         }
//         visited[node] = true
//         for adj in g[node] {
//             dfs(adj)
//         }
        
//         return 1
//     }
//     for i in 0..<n {
//         if !visited[i] {
//             ans += dfs(i)
//         }
//     }
        
//     return ans
// }

print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]]))


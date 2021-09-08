// 네트워크
// 시간 : 40분

import Foundation

var visited = [Bool]()

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    visited = Array(repeating: Bool(), count: n)
    var ans = 0
    for i in 0..<n {
        if !visited[i] {
            ans += dfs(i, n, computers)
        }
    }

    return ans
}

func dfs(_ node: Int, _ n: Int, _ computers: [[Int]]) -> Int {
    if visited[node] == true {
        return 0
    }

    visited[node] = true

    // 한 노드에서 전체 노드 방문
    for adj in 0..<n {
        // 연결되어 있는 인접 노드라면 인접노드를 기준으로 dfs 시작
        if computers[node][adj] == 1 {
            dfs(adj, n, computers)
        }
    }
    
    // 연결되어 있는 모든 노드를 방문한 것을 1로 리턴
    return 1
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


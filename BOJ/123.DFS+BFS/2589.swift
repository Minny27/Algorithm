// 보물섬
// 시간 : 50분

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
var g = [[String]]()
let d = [[-1,0], [1,0], [0,-1], [0,1]]
var ans = 0
for _ in 0..<n {
    g.append(readLine()!.map{String($0)})
}

func boundary(_ i: Int, _ j: Int) -> Bool {
    return (0 <= i && i < n) && (0 <= j && j < m)
}

func bfs(_ i: Int, _ j: Int) {
    var q = [[i, j]]
    var visited = Array(repeating: Array(repeating: 0, count: m), count: n)
    visited[i][j] = 1
    
    while !q.isEmpty {
        let data = q.removeFirst()
        let i = data[0], j = data[1]
        for k in d {
            let ni = i + k[0], nj = j + k[1]
            if !boundary(ni, nj) || visited[ni][nj] != 0 {
                continue
            }
            if g[ni][nj] == "L" {
                visited[ni][nj] = visited[i][j] + 1
                ans = ans < visited[i][j] ? visited[i][j] : ans
                q.append([ni, nj])
                continue
            }
        }
    }
}
    
for i in 0..<n {
    for j in 0..<m {
        if g[i][j] == "W" {
            continue
        }
        bfs(i, j)
    }
}
print(ans)

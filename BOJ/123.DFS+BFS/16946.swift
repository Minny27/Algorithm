// 벽 부수고 이동하기 4

import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
var g = Array(repeating: Array(repeating: 0, count: m), count: n)
for i in 0..<n {
    let line = Array(readLine()!).map { Int(String($0))! }
    for j in 0..<m {
        g[i][j] = line[j]
    }
}
var ans = g
let d = [[-1, 0], [1, 0], [0, -1], [0, 1]]

func boundary(_ i: Int, _ j: Int) -> Bool {
    return 0 <= i && i < n && 0 <= j && j < m
}

func bfs(_ i: Int, _ j: Int) -> Int {
    var q = [[Int]]()
    var visited = Set<[Int]>()
    var cnt = 1
    q.append([i, j])
    visited.insert([i, j])
    
    while !q.isEmpty {
        let (i, j) = (q[0][0], q[0][1])
        q.removeFirst()
        for k in d {
            let (ni, nj) = (i + k[0], j + k[1])
            
            if !boundary(ni, nj) || visited.contains([ni, nj]) {
                continue
            }
            
            if g[ni][nj] == 0 {
                cnt += 1
                visited.insert([ni, nj])
                q.append([ni, nj])
            }
        }
    }
    
    return cnt
}

for i in 0..<n {
    for j in 0..<m {
        if g[i][j] == 1 {
            ans[i][j] = bfs(i, j)
        }
    }
}

for i in 0..<n {
    for j in 0..<m {
        print(ans[i][j], terminator: "")
    }
    print()
}

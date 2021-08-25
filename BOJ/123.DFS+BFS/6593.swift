// 상범 빌딩
// 시간 : 1시간 반

import Foundation

var ans = [String]()
let d = [[-1, 0, 0], [1, 0, 0], [0, -1, 0], [0, 1, 0], [0, 0, -1], [0, 0, 1]]

while true {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let f = input[0], n = input[1], m = input[2]
    if f == 0 && n == 0 && m == 0 {
        break
    }
    var start = [Int]()
    var g = [[[Character]]]()
    
    for floor in 0..<f {
        var matrix = [[Character]]()
        for row in 0..<n {
            let line: [Character] = (Array(readLine()!))
            matrix.append(line)
            for col in line.indices {
                if line[col] == "S" {
                    start = [floor, row, col]
                    continue
                }
            }
        }
        g.append(matrix)
        _ = readLine()!
    }
    
    func boundary(_ k: Int, _ i: Int, _ j: Int) -> Bool {
        return 0 <= k && k < f && 0 <= i && i < n && 0 <= j && j < m
    }

    func bfs(_ k: Int, _ i: Int, _ j: Int) -> String {
        var q = [[Int]]()
        var visited = Array(repeating: Array(repeating: Array(repeating: -1, count: m), count: n), count: f)
        q.append([k, i, j])
        visited[k][i][j] = 0
        
        while !q.isEmpty {
            let data = q.removeFirst()
            let k = data[0], i = data[1], j = data[2]
            for l in d {
                let nk = k + l[0]
                let ni = i + l[1]
                let nj = j + l[2]
                
                if !boundary(nk, ni, nj) || visited[nk][ni][nj] != -1 {
                    continue
                }
                
                if g[nk][ni][nj] == "#" {
                    visited[nk][ni][nj] = 0
                    continue
                }
                
                if g[nk][ni][nj] == "." {
                    visited[nk][ni][nj] = visited[k][i][j] + 1
                    q.append([nk, ni, nj])
                    continue
                }
                if g[nk][ni][nj] == "E" {
                    visited[nk][ni][nj] = visited[k][i][j] + 1
                    return "Escaped in \(visited[nk][ni][nj]) minute(s)."
                }
            }
        }
        
        return "Trapped!"
    }
        
    print(bfs(start[0], start[1], start[2]))
}
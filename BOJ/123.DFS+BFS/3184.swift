// 시간 : 50분

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var g = Array(repeating: Array(repeating: ".", count: m), count: n)
var q = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
let d = [[-1, 0], [1, 0], [0, -1], [0, 1]]
var ans = [0, 0]
for i in 0..<n {
    let line = Array(readLine()!)
    for j in 0..<m {
        g[i][j] = String(line[j])
    }
}

func boundary(i: Int, j: Int) -> Bool {
    return (0 <= i && i < n) && (0 <= j && j < m)
}

func bfs(i: Int, j: Int) {
    q.append([i, j])
    visited[i][j] = true
    var numOfSheep = g[i][j] == "o" ? 1 : 0 // 처음 방문한 칸이 'o'일 때
    var numOfWolf = g[i][j] == "v" ? 1 : 0 // 처음 방문한 칸이 'v'일 때
    while !q.isEmpty {
        let now = q.removeFirst()
        let (i, j) = (now[0], now[1])
        for k in d {
            let ni = i + k[0]
            let nj = j + k[1]
            if !boundary(i: ni, j: nj) || visited[ni][nj] {
               continue
            }
            if g[ni][nj] == "#" {
                visited[ni][nj] = true
                continue
            }
            if g[ni][nj] == "." {
                visited[ni][nj] = true
                q.append([ni, nj])
                continue
            }
            if g[ni][nj] == "v" {
                visited[ni][nj] = true
                numOfWolf += 1
                q.append([ni, nj])
                continue
            }
            if g[ni][nj] == "o" {
                visited[ni][nj] = true
                numOfSheep += 1
                q.append([ni, nj])
                continue
            }
        }
    }
    if numOfSheep > numOfWolf {
        ans[0] += numOfSheep
    }
    else {
        ans[1] += numOfWolf
    }
}

for i in 0..<n {
    for j in 0..<m {
        if !visited[i][j] {
            bfs(i: i, j: j)
        }
    }
}
print(ans[0], ans[1])
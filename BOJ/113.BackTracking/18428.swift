// 감시 피하기

import Foundation

let n = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: "", count: n), count: n)
var teacherLocations = [[Int]]()
var roads = [[Int]]()
var cnt = 3
let d = [[-1, 0], [1, 0], [0, -1], [0, 1]]
var ans = "NO"

for i in 0..<n {
    let line = readLine()!.components(separatedBy: " ").map { String($0) }
    for j in 0..<n {
        graph[i][j] = line[j]
        if line[j] == "T" {
            teacherLocations.append([i, j])
        }
        else if line[j] == "X" {
            roads.append([i, j])
        }
    }
}

func boundary(_ i: Int, _ j: Int) -> Bool {
    return 0 <= i && i < n && 0 <= j && j < n
}

func check() -> Bool {
    for teacherLocation in teacherLocations {
        for k in d {
            var ni = teacherLocation[0]
            var nj = teacherLocation[1]
            
            while true {
                ni += k[0]
                nj += k[1]
                if !boundary(ni, nj) || graph[ni][nj] == "B" {
                    break
                }
                else if graph[ni][nj] == "S" {
                    return true
                }
            }
        }
    }
    return false
}

func dfs(_ index:Int, _ cnt: Int) {
    if cnt == 3 {
        if !check() {
            ans = "YES"
        }
        return
    }
    
    for i in index..<roads.count {
        let ni = roads[i][0]
        let nj = roads[i][1]
        graph[ni][nj] = "B"
        dfs(i + 1, cnt + 1)
        graph[ni][nj] = "X"
    }
}

dfs(0, 0)
print(ans)
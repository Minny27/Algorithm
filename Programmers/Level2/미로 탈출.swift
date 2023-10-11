// 미로 탈출
// 문제 유형: bfs, 다익스트라
// 처음에 문제를 이해할 때 당겨서만 열 수 있다는 말을 이해못했었는데 다시 방문이 안 된다라고 생각하고 품
// S -> L, L -> E 두 번의 최단 경로를 구해서 더하면 됨.
// 여기서 함정은 둘 중의 하나라도 갈 수 없는 경우가 있기 때문에, bfs의 return을 bool로 만들어서
// 두 경로 모두 true이면 answer, 아니면 -1 리턴
// 두 번의 최단경로를 구해야하는 것을 파악했으면 빠르게 더 빠르게 풀 수 있었어야했다..

import Foundation

func solution(_ maps:[String]) -> Int {
    let maps = maps.map { $0.map { $0 } }
    let n = maps.count
    let m = maps[0].count
    let dir = [[1,0],[-1,0],[0,1],[0,-1]]
    var s = [0,0]
    var l = [0,0] 
    var e = [0,0]
    var answer = 0
    
    for i in 0..<n {
        for j in 0..<m {
            if maps[i][j] == "S" { s = [i,j]; continue }
            if maps[i][j] == "L" { l = [i,j]; continue }
            if maps[i][j] == "E" { e = [i,j]; continue }
        }
    }
    
    func bfs(_ s: [Int], _ e: [Int]) -> Bool {
        var visited = Array(repeating: Array(repeating: false, count: m), count: n)
        var queue = [[s[0], s[1], 0]]
        
        while !queue.isEmpty {
            let q = queue.removeFirst()
            let (i, j, c) = (q[0], q[1], q[2])
            
            if !visited[i][j] {
                visited[i][j] = true
                
                if maps[i][j] == maps[e[0]][e[1]] {
                    answer += c
                    return true
                }
                
                for d in dir {
                    let (ni, nj) = (i + d[0], j + d[1])
                    if ni < 0 || ni >= n || nj < 0 || nj >= m { continue }
                    if maps[ni][nj] == "X" { continue }
                    queue.append([ni, nj, c + 1])   
                }
            }
        }
        return false
    }
    
    return bfs(s, l) && bfs(l, e) ? answer : -1
}
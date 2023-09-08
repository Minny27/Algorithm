// 리코쳇 로봇
// 문제 유형: bfs + 다익스트라
// 문제 해석: 벽이 있을 때 까지 진행하는 문제는 처음 풀어봐서 좀 생소했음
// 종료조건을 어떻게 줄 지 고민하는 측면에서 시간을 많이 소요
// 처음에는 모든 방문지점에서 visited를 체크하면 된다고 생각했는데 그러면 다른 경로에서 탐색을 못함.
// 그래서 move 함수로 벽 또는 끝지점에 도달했을 때만 visited를 체크하고 체크할 때는 이전 지점에서의 횟수 + 1
// bfs는 처음으로 도달한 도착지점이 최단 경로이기 때문에 가능한 풀이
// 타입관련해서 typealias, struct 등을 썼었는데 문제 풀이에 최적화를 위해서 튜플을 사용하는게 시간절약이 많이 되는 것 같다.
// 그리고 bfs의 경우, 큐, 방문 여부 배열, 방향 등 다양한 변수가 필요하기 때문에 함수화를 안 하는게 더 빠른 거 같다.
// 함수화를 굳이 하지 않아도 되는 것은 하지 말자
// 코테를 위한 최적화를 할 필요가 있어 보임

import Foundation

func solution(_ board:[String]) -> Int {
    let boards = board.map { $0.map { String($0) }}
    let (n, m) = (board.count, board[0].count)
    let dir = [[0,1],[0,-1],[-1,0],[1,0]]
    var rp = (0,0) // 시작 지점
    var gp = (0,0) // 도착 지점
    var visited = Array(repeating: Array(repeating: -1, count: m), count: n)
    
    for i in 0..<board.count {
        for j in 0..<board[0].count {
            if boards[i][j] == "R" {
                rp = (i, j)
                visited[rp.0][rp.1] = 0 // 방문 여부 및 횟수 갱신을 위함
            }
            else if boards[i][j] == "G" { gp = (i,j) }
        }
    }

    // 벽에 도달하거나 보드의 끝에 도달할 때까지 이동하는 함수
    func move(_ i: Int, _ j: Int, _ d: [Int]) -> (Int, Int) {
        var (ni, nj) = (i, j)
        while true {
            (ni, nj) = (ni + d[0], nj + d[1])
            if ni < 0 || ni >= n || nj < 0 || nj >= m { break }
            if boards[ni][nj] == "D" { break }
        }
        return (ni - d[0], nj - d[1])
    }

    // bfs
    var queue = [(rp.0, rp.1)]
    while !queue.isEmpty {
        let (i, j) = queue.removeFirst()

        for d in dir {
            let (ni, nj) = move(i, j, d)

            // 방문 안 했을 때만 방문 횟수 갱신 및 queue에 추가
            if visited[ni][nj] == -1 {
                visited[ni][nj] = visited[i][j] + 1
                queue.append((ni, nj))
            }
        }
    }
    
    // 가장 처음에 도착 지점에 도달한 경우가 답
    return visited[gp.0][gp.1]
}


print(solution(["...D..R", ".D.G...", "....D.D", "D....D.", "..D...."]))

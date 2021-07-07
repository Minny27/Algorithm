// 경주로 건설
// 시간 : 5시간

// 뱡향 : 0 : 북, 1 : 남, 2 : 서, 3 : 동, 4: 방향 없음(0,0)
import Foundation
func solution(_ board:[[Int]]) -> Int {
    var nBoard = [[Int]](repeating: Array(repeating: Int.max, count: board.count), count: board.count)
    nBoard[0][0] = 0
    for i in 0..<board.count {
        for j in 0..<board.count {
            if board[i][j] == 1 {
                nBoard[i][j] = -1
            }
        }
    }
    let d : [[Int]] = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    var ans = 0
    
    // 맵을 넘어 갔을 때 처리
    func boundary(i : Int, j : Int) -> Bool {
        return (0 <= i && i < board.count) && (0 <= j && j < board.count)
    }
    
    func bfs() {
        var q : [[Int]] = [[0, 0, 0, 4]]
        while !q.isEmpty {
            q.sort(by: {$0[0] < $1[0]}) // 비용 기준 정렬
            let (c, i, j, nd) = (q[0][0], q[0][1], q[0][2], q[0][3])
            q.removeFirst()
            
            // 도착지점에 가장 먼저 도착한 비용을 출력
            if i == board.count - 1 && j == board.count - 1 {
                ans = nBoard[board.count - 1][board.count - 1]
                return
            }
            
            // 이전 지점과 동일한 방향일 때는 비용 + 100, 다르면 비용 + 600
            for k in 0..<d.count {
                let ni = i + d[k][0]
                let nj = j + d[k][1]
                // 범위를 넘어가거나 벽이 나왔을 때 넘어가기
                if !boundary(i : ni, j : nj) || nBoard[ni][nj] == -1 {
                    continue
                }
                if (k == 0) && (nd != 2 && nd != 3) {
                    if nBoard[ni][nj] >= c + 100 {
                        nBoard[ni][nj] = c + 100
                        q.append([nBoard[ni][nj], ni, nj, k])
                    }
                }
                else if (k == 0) && (nd == 2 || nd == 3) {
                    if nBoard[ni][nj] >= c + 600 {
                        nBoard[ni][nj] = c + 600
                        q.append([nBoard[ni][nj], ni, nj, k])
                    }
                }
                else if (k == 1) && (nd != 2 && nd != 3) {
                    if nBoard[ni][nj] >= c + 100 {
                        nBoard[ni][nj] = c + 100
                        q.append([nBoard[ni][nj], ni, nj, k])
                    }
                    else {
                        q.append([c + 100, ni, nj, k]) // 임시방편
                    }
                }
                else if (k == 1) && (nd == 2 || nd == 3) {
                    if nBoard[ni][nj] >= c + 600 {
                        nBoard[ni][nj] = c + 600
                        q.append([nBoard[ni][nj], ni, nj, k])
                    }
                }
                else if (k == 2) && (nd != 0 && nd != 1) {
                    if nBoard[ni][nj] >= c + 100 {
                        nBoard[ni][nj] = c + 100
                        q.append([nBoard[ni][nj], ni, nj, k])
                    }
                }
                else if (k == 2) && (nd == 0 || nd == 1) {
                    if nBoard[ni][nj] >= c + 600 {
                        nBoard[ni][nj] = c + 600
                        q.append([nBoard[ni][nj], ni, nj, k])
                    }
                }
                else if (k == 3) && (nd != 0 && nd != 1) {
                    if nBoard[ni][nj] >= c + 100 {
                        nBoard[ni][nj] = c + 100
                        q.append([nBoard[ni][nj], ni, nj, k])
                    }
                    else {
                        q.append([c + 100, ni, nj, k]) // 임시방편
                    }
                }
                else if (k == 3) && (nd == 0 || nd == 1) {
                    if nBoard[ni][nj] >= c + 600 {
                        nBoard[ni][nj] = c + 600
                        q.append([nBoard[ni][nj], ni, nj, k])
                    }
                }
            }
        }
    }
    bfs()
    return ans
}

print(solution([[0,0,0],[0,0,0],[0,0,0]])) // 답 : 900
print(solution([[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,0],[0,0,0,0,1,0,0,0],[0,0,0,1,0,0,0,1],[0,0,1,0,0,0,1,0],[0,1,0,0,0,1,0,0],[1,0,0,0,0,0,0,0]])) // 답 3800
print(solution([[0,0,1,0],[0,0,0,0],[0,1,0,1],[1,0,0,0]])) // 답 : 2100
print(solution([[0,0,0,0,0,0],[0,1,1,1,1,0],[0,0,1,0,0,0],[1,0,0,1,0,1],[0,1,0,0,0,1],[0,0,0,0,0,0]])) // 답 : 3200
print(solution([[0, 0, 0, 0, 0], [0, 1, 1, 1, 0], [0, 0, 1, 0, 0], [1, 0, 0, 0, 1], [0, 1, 1, 0, 0]])) // 답 : 3000
print(solution([[0, 1, 1, 1, 1, 1, 1, 1, 1],
                [0, 0, 0, 0, 0, 1, 1, 1, 1],
                [1, 1, 1, 1, 0, 1, 1, 1, 1],
                [0, 0, 0, 0, 0, 1, 1, 1, 1],
                [0, 1, 0, 1, 1, 1, 1, 1, 1],
                [0, 1, 0, 0, 0, 1, 1, 1, 1],
                [0, 1, 1, 1, 0, 1, 1, 1, 1],
                [0, 0, 0, 0, 0, 1, 1, 1, 1],
                [1, 1, 1, 1, 0, 0, 0, 0, 0]])) // 답 : 5500
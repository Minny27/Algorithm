// 섬의 개수

typealias Point = (i: Int, j: Int)

let ds = [(-1,0),(1,0),(0,-1),(0,1),(-1,-1),(-1,1),(1,1),(1,-1)]
var answer = ""
var n = 0, m = 0
var board = [[Int]]()
var visited = [[Bool]]()

func isBoundary(_ point: Point) -> Bool {
    return 0 <= point.i && point.i < n && 0 <= point.j && point.j < m
}

func bfs(_ point: Point) -> Int {
    var q = [point]
    
    while !q.isEmpty {
        let point = q.removeLast()
        visited[point.i][point.j] = true
        
        for d in ds {
            let ni = point.i + d.0
            let nj = point.j + d.1
            
            if !isBoundary(Point(ni, nj)) || board[ni][nj] == 0 || visited[ni][nj] { continue }
            q.append(Point(ni, nj))
        }
    }
    return 1
}

func solution() {
    while true {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        m = input[0]
        n = input[1]
        
        if n == 0 && m == 0 { break }
        
        board = [[Int]]()
        visited = Array(repeating: Array(repeating: false, count: m), count: n)
        var result = 0
        
        for _ in 0..<n {
            board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
        }
        
        for i in 0..<n {
            for j in 0..<m {
                if visited[i][j] || board[i][j] == 0 { continue }
                result += bfs(Point(i, j))
            }
        }
        answer += "\(result)\n"
    }
    print(answer)
}

solution()

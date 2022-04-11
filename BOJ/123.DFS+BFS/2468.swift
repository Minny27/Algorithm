// 안전 영역

typealias Point = (i: Int, j: Int)

let n = Int(readLine()!)!
let ds = [(-1,0),(1,0),(0,-1),(0,1)]
var board = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var visitedCopy = [[Bool]]()
var answer = 0

for _ in 0..<n {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

func isBoundary(_ i: Int, _ j: Int) -> Bool {
    return 0 <= i && i < n && 0 <= j && j < n
}

func dfs(_ point: Point, _ k: Int) -> Int {
    if !isBoundary(point.i, point.j) || visitedCopy[point.i][point.j] || board[point.i][point.j] <= k { return 1 }
    
    visitedCopy[point.i][point.j] = true
    
    for d in ds {
        let ni = point.i + d.0
        let nj = point.j + d.1
        
        dfs(Point(ni, nj), k)
    }
    return 1
}

func solution() {
    for k in 0...100 {
        visitedCopy = visited
        var result = 0
        for i in 0..<n {
            for j in 0..<n {
                if visitedCopy[i][j] || board[i][j] <= k { continue }
                result += dfs(Point(i, j), k)
            }
        }
        answer = max(answer, result)
    }
    print(answer)
}

solution()

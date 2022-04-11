// 연구소

typealias Point = (i: Int, j: Int)

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]
let ds = [(-1,0),(1,0),(0,-1),(0,1)]
var board = [[Int]]()
var boardCopy = board
var zeroPoints = [Point]()
var virusPoints = [Point]()
var combinations = [[Point]]()
var combiVisited = [Bool]()
var answer = 0

for _ in 0..<n {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

func isBoundary(_ i: Int, _ j: Int) -> Bool {
    return 0 <= i && i < n && 0 <= j && j < m
}

func updateMaxSafety() {
    var count = 0
    for i in 0..<n {
        for j in 0..<m {
            if boardCopy[i][j] == 0 {
                count += 1
            }
        }
    }
    answer = max(answer, count)
}

func spread(_ start: Point) {
    var q = [start]
    
    while !q.isEmpty {
        let point = q.removeFirst()
        
        for d in ds {
            let ni = point.i + d.0
            let nj = point.j + d.1
            
            if !isBoundary(ni, nj) || boardCopy[ni][nj] != 0 { continue }
            boardCopy[ni][nj] = 2
            q.append(Point(ni,nj))
        }
    }
}

func combination(_ subArray: [Point], _ index: Int, _ count: Int, _ totalCount: Int) {
    if count == totalCount {
        combinations.append(subArray)
        return
    }
    
    for i in stride(from: index, to: zeroPoints.count, by: 1) {
        var subArray = subArray
        subArray.append(zeroPoints[i])
        
        if combiVisited[i] == true { continue }
        
        combiVisited[i] = true
        combination(subArray, i, count + 1, totalCount)
        combiVisited[i] = false
    }
}

func solution() {
    for i in 0..<n {
        for j in 0..<m {
            if board[i][j] == 2 {
                virusPoints.append(Point(i,j))
            } else if board[i][j] == 0 {
                zeroPoints.append(Point(i,j))
            }
        }
    }
    
    combiVisited = Array(repeating: false, count: zeroPoints.count)
    combination([], 0, 0, 3)
    
    for data in combinations {
        boardCopy = board
        let one = data[0], two = data[1], three = data[2]
        boardCopy[one.i][one.j] = 1
        boardCopy[two.i][two.j] = 1
        boardCopy[three.i][three.j] = 1
        
        for virusPoint in virusPoints {
            spread(virusPoint)
        }
        updateMaxSafety()
    }
    
    print(answer)
}

solution()

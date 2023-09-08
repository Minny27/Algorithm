// 혼자서 하는 틱택토
// 문제 유형: 그리디
// 처음에는 for문으로 행, 열, 왼쪽, 오른쪽 대각선 네 개의 for문을 사용해서 반복되는 코드가 많았음.
// 또한 조건도 한 번에 적용했으면 됐는데... o, x 카운트와 o, x 승리 여부를 글로벌 변수로 두고
// 조건문을 하나씩 파악하는 방식을 생각하지 못한게 아쉬웠음.
// 또한 빙고 한 라인을 for문으로 파악하려고 했던 건 패착이었음..
// i, j로 나올 수 있는 라인을 모두 정의해놓고 그 컬렉션을 반복해서 각 라인의 o, x 개수를 파악하는 것이 좋은 방법이었음.
// 또한 조건도 개수로 먼저 거르고 개수 + 승리 유무 조건으로 거르는 게 더 효율적이라는 것을 알게 됨

import Foundation

func solution(_ board:[String]) -> Int {
    let board = board.map { $0.map { String($0) } }
    var (oCount,xCount,isOWin,isXWin) = (0,0,false,false)
    
    let lines = [[0,0,0,1,0,2],
                  [1,0,1,1,1,2],
                  [2,0,2,1,2,2],
                  [0,0,1,0,2,0],
                  [0,1,1,1,2,1],
                  [0,2,1,2,2,2],
                  [0,0,1,1,2,2],
                  [0,2,1,1,2,0]]
    
    for l in board {
        for v in l {
            if v == "O" { oCount += 1; continue }
            if v == "X" { xCount += 1; continue }
        }
    }
    
    for line in lines {
        let di = [line[0], line[2], line[4]]
        let dj = [line[1], line[3], line[5]]
        var (o,x) = (0,0)
        
        for k in 0..<3 {
            let (i,j) = (di[k], dj[k])
            if board[i][j] == "O" { o += 1; continue }
            if board[i][j] == "X" { x += 1; continue }
        }
        
        if o == 3 { isOWin = true; continue }
        if x == 3 { isXWin = true; continue }
    }
    
    // x 개수가 o보다 많을 수 없음
    if xCount > oCount { return 0 }
        
    // 무조건 o의 개수는 x의 개수보다 0 또는 1 많다
    if oCount - xCount >= 2 { return 0 }

    // 둘 다 이기는 경우는 없음
    if isOWin && isXWin { return 0 }
    
    // O가 이기는 경우, 무조건 o == x + 1
    if isOWin && oCount != xCount + 1 { return 0 }
    
    // X가 이기는 경우, 무조건 o == x
    if isXWin && oCount != xCount { return 0 }
        
    return 1
}

// 이전 코드
//func solution(_ board:[String]) -> Int {
//    let board = board.map { $0.map { String($0) } }
//    var oCount = 0
//    var xCount = 0
//
//    for l in board {
//        for v in l {
//            if v == "O" { oCount += 1; continue }
//            if v == "X" { xCount += 1; continue }
//        }
//    }
//
//    if oCount == xCount || oCount > xCount && oCount - xCount < 2 {
//        var (isOWin, isXWin) = (false, false)
//        var (o,x) = (0,0)
//        // 행 승리 조건 체크
//        for i in 0..<3 {
//            (o,x) = (0,0)
//            for j in 0..<3 {
//                if board[i][j] == "O" { o += 1; continue }
//                if board[i][j] == "X" { x += 1; continue }
//            }
//            if o == 3 { isOWin = true }
//            if x == 3 { isXWin = true }
//
//            if isOWin && isXWin || isXWin && oCount > xCount || isOWin && oCount != xCount + 1 { return 0 }
//        }
//
//        (isOWin, isXWin) = (false, false)
//        // 열 승리 조건 체크
//        for i in 0..<3 {
//            (o,x) = (0,0)
//            for j in 0..<3 {
//                if board[j][i] == "O" { o += 1; continue }
//                if board[j][i] == "X" { x += 1; continue }
//            }
//            if o == 3 { isOWin = true }
//            if x == 3 { isXWin = true }
//
//            if isOWin && isXWin || isXWin && oCount > xCount || isOWin && oCount != xCount + 1 { return 0 }
//        }
//
//        (isOWin, isXWin) = (false, false)
//        (o,x) = (0,0)
//        // 왼쪽 대각선 승리 조건 체크
//        for i in 0..<3 {
//            for j in 0..<3 {
//                if i == j {
//                    if board[i][j] == "O" { o += 1; continue }
//                    if board[i][j] == "X" { x += 1; continue }
//                }
//            }
//            if o == 3 { isOWin = true }
//            if x == 3 { isXWin = true }
//
//            if isOWin && isXWin || isXWin && oCount > xCount || isOWin && oCount != xCount + 1 { return 0 }
//        }
//
//        (isOWin, isXWin) = (false, false)
//        (o,x) = (0,0)
//        // 오른쪽 대각선 승리 조건 체크
//        for i in 0..<3 {
//            for j in 0..<3 {
//                if abs(i - j) == 2 || (i == 1 && j == 1) {
//                    if board[i][j] == "O" { o += 1; continue }
//                    if board[i][j] == "X" { x += 1; continue }
//                }
//            }
//            if o == 3 { isOWin = true }
//            if x == 3 { isXWin = true }
//
//            if isOWin && isXWin || isXWin && oCount > xCount || isOWin && oCount != xCount + 1 { return 0 }
//        }
//    } else { return 0 }
//
//    return 1
//}


//print(solution(["O.X", ".O.", "..X"])) // 1
//print(solution(["OOO", "...", "XXX"])) // 0
//print(solution(["...", ".X.", "..."])) // 0
//print(solution(["...", "...", "..."])) // 1
print(solution(["O.X", "O.X", "O.."])) // 1
print(solution(["OOX", "OOX", "XXO"])) // 1
print(solution(["XOX", "OXO", "XOO"])) // 0
print(solution(["O.X", "O..", "O.."])) // 0

print(solution(["OOO", "...", "XXX"])) // 0

print(solution(["XO.", "OXO", "XOX"])) // 1

print(solution(["OOO", "XOX", "XXO"])) // 1

print(solution(["XOX", "OXO", "XOX"])) // 0

print(solution(["OXO", "XOX", "OXO"])) // 1

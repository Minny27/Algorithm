// N-Queen

import Foundation

var chessLocation = [Int]()
var num = 0
var ans = 0

func solution(_ n:Int) -> Int {
    num = n
    chessLocation = Array(repeating: -1, count: n + 1)
    dfs(0)
    
    return ans
}

func check(_ row: Int, _ col: Int) -> Bool {
    for j in 0..<col {
        if chessLocation[j] == row || abs(row - chessLocation[j]) - abs(col - j) == 0 {
            return false
        }
    }
    return true
}

func dfs(_ cnt: Int) {
    if cnt == num {
        ans += 1
        return
    }
    
    for i in 0..<num {
        if check(i, cnt) {
            chessLocation[cnt] = i
            dfs(cnt + 1)
            chessLocation[cnt] = -1
        }
    }
}

print(solution(4))

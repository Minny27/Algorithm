// N-Queen

import Foundation

let n = Int(readLine()!)!
var chessLocation = Array(repeating: -1, count: n + 1)
var ans = 0

func check(_ row: Int, _ col: Int) -> Bool {
    for j in 0..<col {
        if chessLocation[j] == row || abs(row - chessLocation[j]) - abs(col - j) == 0 {
            return false
        }
    }
    return true
}

func dfs(_ cnt: Int) {
    if cnt == n {
        ans += 1
        return
    }

    for i in 0..<n {
        if check(i, cnt) {
            chessLocation[cnt] = i
            dfs(cnt + 1)
            chessLocation[cnt] = -1
        }
    }
}

dfs(0)
print(ans)
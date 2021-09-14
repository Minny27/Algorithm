// 뮤탈리스크

import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = Array(repeating: Array(repeating: Array(repeating: -1, count: 61), count: 61), count: 61)
var scv = [0, 0, 0]
var ans = Int.max

for i in 0..<arr.count {
    scv[i] = arr[i]
}

func dfs(_ hp1: Int, _ hp2: Int, _ hp3: Int, _ cnt: Int) {
    let hp1 = hp1 < 0 ? 0 : hp1
    let hp2 = hp2 < 0 ? 0 : hp2
    let hp3 = hp3 < 0 ? 0 : hp3
    
    if hp1 == hp2 && hp2 == hp3 && hp3 == 0 {
        ans = ans > cnt ? cnt : ans
        return
    }
    
    // dp[hp1][hp2][hp3] < cnt 라고 하면 시간 초과 발생 -> 조합에서 순열이 될 수 있음
    if dp[hp1][hp2][hp3] != -1 && dp[hp1][hp2][hp3] <= cnt {
       return
    }
    
    dp[hp1][hp2][hp3] = cnt
        
    dfs(hp1 - 9, hp2 - 3, hp3 - 1, cnt + 1)
    dfs(hp1 - 9, hp2 - 1, hp3 - 3, cnt + 1)
    dfs(hp1 - 3, hp2 - 9, hp3 - 1, cnt + 1)
    dfs(hp1 - 3, hp2 - 1, hp3 - 9, cnt + 1)
    dfs(hp1 - 1, hp2 - 9, hp3 - 3, cnt + 1)
    dfs(hp1 - 1, hp2 - 3, hp3 - 9, cnt + 1)
}

dfs(scv[0], scv[1], scv[2], 0)
print(ans)

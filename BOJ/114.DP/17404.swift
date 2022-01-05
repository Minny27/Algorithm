// RGB 거리 2

import Foundation

let n = Int(readLine()!)!
var rgb = [[Int]]()
var dp = Array(repeating: Array(repeating: 1001, count: n), count: n)
var ans = 1000 * 1000 + 1

for _ in 0..<n {
    let line = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
    rgb.append(line)
}

for k in 0..<3 {
    for i in 0..<3 {
        if i == k {
            dp[0][i] = rgb[0][i]
        }
        
        else {
            dp[0][i] = 1000 * 1000 + 1
        }
    }
    
    for i in 1..<n {
        dp[i][0] = min(dp[i - 1][1], dp[i - 1][2]) + rgb[i][0]
        dp[i][1] = min(dp[i - 1][0], dp[i - 1][2]) + rgb[i][1]
        dp[i][2] = min(dp[i - 1][0], dp[i - 1][1]) + rgb[i][2]
    }
    
    for i in 0..<3 {
        if i == k {
            continue
        }
        
        else {
            ans = min(ans, dp[n - 1][i])
        }
    }
}

print(ans)
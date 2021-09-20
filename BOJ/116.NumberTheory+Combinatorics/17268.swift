// 미팅의 저주

import Foundation

let n = Int(readLine()!)! / 2
let mod = 987654321
var dp = Array(repeating: 0, count: n + 1)
dp[0] = 1

for i in 1...n {
    for j in 0..<i {
        dp[i] += ((dp[j] % mod) * dp[i - 1 - j] % mod) % mod
    }
    dp[i] %= mod
}
print(dp[n] % mod)
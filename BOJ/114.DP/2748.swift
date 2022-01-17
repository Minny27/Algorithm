// 피보나치 수 2

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n + 1)
dp[1] = 1

for i in 2..<n + 1 {
    dp[i] = dp[i - 1] + dp[i - 2]
}

print(dp[n])
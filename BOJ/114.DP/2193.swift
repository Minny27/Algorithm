// 이친수

let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n + 1)
dp[1] = 1

for i in 2..<n+1 {
    dp[i] = dp[i - 1] + dp[i - 2]
}

print(dp[n])
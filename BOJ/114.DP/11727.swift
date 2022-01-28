// 2×n 타일링 2

let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n + 1)
dp[0] = 1
dp[1] = 1

for i in 2..<n+1 {
    dp[i] = (dp[i - 1] + dp[i - 2] * 2) % 10007
}

print(dp[n])
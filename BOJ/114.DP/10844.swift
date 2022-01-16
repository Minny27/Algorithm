// 쉬운 계단 수

let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: 101)
var ans = 0
dp[1] = [1,1,1,1,1,1,1,1,1,1]


for i in 2..<n+1 {
    for j in 0..<10 {
        switch j {
        case 0:
            dp[i][0] = dp[i - 1][1]
        case 9:
            dp[i][9] = dp[i - 1][8]
        default:
            dp[i][j] = (dp[i - 1][j - 1] + dp[i - 1][j + 1]) % 1000000000
        }
    }
}

for i in 1..<10 {
    ans += dp[n][i]
}

print(ans % 1000000000)
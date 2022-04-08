// 제곱수의 합

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n + 1)

func solution() {
    for i in 1...n {
        dp[i] = i
        for j in 1...i {
            if j * j > i { break }
            dp[i] = min(dp[i], dp[i - j * j] + 1)
        }
    }
}

solution()
print(dp[n])
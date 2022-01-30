// 오르막 수
import Foundation

let n = Int(readLine()!)!
var dp = [Int](repeating: 1, count: 10)
var answer = 0

for _ in 1 ..< n {
    for j in 1 ..< 10 {
        dp[j] = (dp[j] + dp[j - 1]) % 10007
    }
}

print(dp.reduce(0, +) % 10007)


// 중복 조합으로 구현 -> 실패
// var dp = [Int](repeating: 1, count: 1011)

// func factorial(_ n: Int) {
//     for i in 1 ..< n + 1 {
//         dp[i] = (dp[i - 1] * i) % 10007
//     }
// }

// let n = Int(readLine()!)! - 1
// factorial(10 + n)

// let answer = (dp[10 + n] / (dp[10 + n - 9] * dp[9])) % 10007
// print(answer)
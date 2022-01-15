// 카드 구매하기

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
var dp = Array(repeating: 0, count: n + 1)

for i in 1..<n + 1 {
    for j in 0..<i {
        dp[i] = max(dp[i], dp[i - j - 1] + array[j])
    }
}

print(dp[n])

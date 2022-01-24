// 동전 1

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], k = input[1]
var dp = [Int](repeating: 0, count: k + 1)
dp[0] = 1 // 동전 하나로 만들 수 경우의 수
var coin = [Int]()

for _ in 0 ..< n {
    coin.append(Int(readLine()!)!)
}

for i in 0 ..< coin.count where coin[i] <= k {
    for v in coin[i] ..< k + 1 {
        dp[v] = (dp[v] + dp[v - coin[i]]) % Int(pow(2.0, 31.0))
    }
}

print(dp[k])
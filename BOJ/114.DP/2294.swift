// 동전 2

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], k = input[1]
var coin = [Int]()
var dp = [Int](repeating: k + 1, count: k + 1)

for _ in 0 ..< n {
    let value = Int(readLine()!)!
    coin.append(value)
}

for value in coin where value <= k {
    dp[value] = 1
    for i in value + 1 ..< k + 1 {
        dp[i] = min(dp[i], dp[i - value] + 1)
    }
}

if dp[k] > k {
    print(-1)
}

else {
    print(dp[k])
}
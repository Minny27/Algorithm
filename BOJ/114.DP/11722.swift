// 가장 긴 감소하는 부분 수열

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = Array(repeating: 1, count: n)
var maxValue = 1

for i in 0..<n {
    for j in i+1..<n {
        if array[i] > array[j] {
            dp[j] = max(dp[j], dp[i] + 1)
            maxValue = max(maxValue, dp[j])
        }
    }
}
print(maxValue)
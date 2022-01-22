// 파도반 수열

let n = Int(readLine()!)!
var array = [Int](repeating: 0, count: n)
var dp = [Int](repeating: 0, count: 101)

for i in 0..<n {
    array[i] = Int(readLine()!)!
}

for i in 1..<101 {
    if i == 1 || i == 2 || i == 3 {
        dp[i] = 1
        continue
    }
    
    dp[i] = dp[i - 2] +  dp[i - 3]
}

array.forEach {
    print(dp[$0])
}
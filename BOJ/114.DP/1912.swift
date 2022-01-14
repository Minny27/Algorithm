// 연속합

import Foundation

let n = Int(readLine()!)!
let array = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
var dp = Array(repeating: -1001, count: n)
var ans = -1001

func continuitySum(_ n: Int, _ array: [Int]) {
    dp[0] = array[0]
    ans = dp[0] > ans ? dp[0] : ans
    
    for i in 1..<n {
        if dp[i - 1] + array[i] > array[i] {
            dp[i] = dp[i - 1] + array[i]
            ans = dp[i] > ans ? dp[i] : ans
        }
        
        else {
            dp[i] = array[i]
            ans = dp[i] > ans ? dp[i] : ans
        }
    }
    
    print(ans)
}

continuitySum(n, array)
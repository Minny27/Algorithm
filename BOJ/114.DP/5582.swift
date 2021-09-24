// 공통 부분 문자열
// 시간: 20분

import Foundation

let str1 = readLine()!.map{ String($0) }
let str2 = readLine()!.map{ String($0) }
var dp = Array(repeating: Array(repeating: 0, count: str1.count + 1), count: str2.count + 1)
var ans = 0

for i in 1..<str2.count + 1 {
    for j in 1..<str1.count + 1 {
        if str2[i - 1] == str1[j - 1] {
            dp[i][j] = dp[i - 1][j - 1] + 1
            ans = max(ans, dp[i][j])
        }
    }
}
print(ans)

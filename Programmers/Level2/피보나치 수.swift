// 피보나치 수
// 문제 유형: DP
// 느낀점: 예전 2단계가 이 정도 난이도였는데..

func solution(_ n:Int) -> Int {
    var dp = Array(repeating: 0, count: n+1)
    dp[1] = 1
    for i in 2...n {
        dp[i] = (dp[i-2] + dp[i-1]) % 1234567
    }
    return dp[n]
}
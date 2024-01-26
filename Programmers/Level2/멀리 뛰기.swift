// 멀리 뛰기
// 문제 유형: DP
// 느낀점: n이 2000까지 인 것을 보고 DFS로는 풀 수 없다는 것을 빨리 알았어야했는데..
// 풀이 방법: 수가 올라갈 때마다 그 이전의 경우의 수를 곱한만큼 다음 경우의 수가 체크되어 int값을 넘어설 수 있음.
// 1: 1, 2: 2, 3: 3, 4: 5, 5: 8, 6: 13 ...
// 1부터 6까지를 보니까 피보나치 수라는 것을 파악해서 DP로 풂

func solution(_ n:Int) -> Int {
    guard n != 1 else { return 1 }
    var dp = [1, 2]
    
    for i in 2..<n {
        dp.append((dp[i-2] + dp[i-1]) % 1234567)
    }
    return dp[n-1]
}

// 시간 초과 코드
// var nn = 0
// var answer = 0
// var numArr = [1,2]

// func solution(_ n:Int) -> Int {
//     nn = n
//     permu(0)
//     return answer % 1234567
// }

// func permu(_ total: Int) {
//     if total == nn {
//         answer += 1
//         return
//     }
    
//     if total > nn {
//         return
//     }
    
//     for num in numArr {
//         permu(total + num)
//     }
// }

// 구간 합 구하기 4
// 문제 유형: DP
// 느낀점: DP는 아직 많이 부족하다.. 구간합에 대해서 좀 찾아봐서 이해하게 됨
// 풀이 방법: 구간합의 끝값 - (구간합의 시작-1 값)으로 구할 수 있었음.

let l = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (l[0],l[1])

let arr = readLine()!.split(separator: " ").map { Int($0)! }

var dp = Array(repeating: 0, count: n+1)

for i in 1...n {
  dp[i] = dp[i-1] + arr[i-1]
}


for _ in 0..<m {
  let l = readLine()!.split(separator: " ").map { Int($0)! }
  let (s,e) = (l[0],l[1])
  print(dp[e] - dp[s-1])
}

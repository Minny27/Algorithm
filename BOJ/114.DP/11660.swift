// 구간 합 구하기 5
// 문제 유형: DP
// 느낀점: 구간 합 공식 및 원리를 알아놓자! 아니 x, y라고 해놓고 행열이었다니..
// 풀이 방법: dp[끝y][끝x] - dp[끝y][시작x-1] - dp[시작y-1][끝x] + dp[시작y-1][시작x-1]

let l = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (l[0],l[1])

var arr = Array(repeating: Array(repeating: 0, count: n), count: n)
var dp = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)

for i in 0..<n {
  let l = readLine()!.split(separator: " ").map { Int($0)! }
  for j in 0..<n {
    arr[i][j] = l[j]
  }
}

for i in 1...n {
  for j in 1...n {
    dp[i][j] = dp[i][j-1] + dp[i-1][j] - dp[i-1][j-1] + arr[i-1][j-1]
  }
}

for _ in 0..<m {
  let l = readLine()!.split(separator: " ").map { Int($0)! }
  let (i,j,ii,jj) = (l[0],l[1],l[2],l[3])
  print(dp[ii][jj] - dp[ii][j-1] - dp[i-1][jj] + dp[i-1][j-1])
}


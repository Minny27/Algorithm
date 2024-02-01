// 2차원 배열의 합
// 문제 유형: DP
// 느낀점: 공식을 알면 숩다 수워
// 풀이 방식: 가로, 세로합 DP에 저장 후, dp[ii][jj] - dp[ii][j-1] - dp[i-1][jj] + dp[i-1][j-1] 출력

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var array = [[Int]]()
var dp = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)

for _ in 0..<n {
  let line = readLine()!.split(separator: " ").map { Int($0)! }
  array.append(line)
}

for i in 1...n {
  for j in 1...m {
    dp[i][j] = dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1] + array[i-1][j-1]
  }
}

let k = Int(readLine()!)!

for _ in 0..<k {
  let line = readLine()!.split(separator: " ").map { Int($0)! }
  let (i,j,ii,jj) = (line[0],line[1],line[2],line[3])
  print(dp[ii][jj] - dp[ii][j-1] - dp[i-1][jj] + dp[i-1][j-1])
}

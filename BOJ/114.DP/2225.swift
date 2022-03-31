// 합분해

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], k = input[1]
let mod = 1000000000
var numberArray = (0...n).map { Int($0) }
var dp = Array(repeating: Array(repeating: 1, count: n + 1), count: k)

func solution() {
    for i in 1..<k {
        for j in 1...n {
            dp[i][j] = (dp[i][j - 1] + dp[i - 1][j]) % mod
        }
    }
    print(dp[k - 1][n])
}

solution()

// 풀이 과정
// 3 2
// 0 1 2 3
// 1 2 3 4
// 2 3 4 5
// 3 4 5 6

// 0 0
// 0 1
// 0 2
// 0 3

// 1 0
// 1 

// dp
// 1
// 0 1 2 3
// 0 0 0 1

// 2
// 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
// 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1  1  1  1

//   6 5 4 3 2 1 0
//   0 1 2 3 4 5 6   
// ---------------
// 1 1 1 1 1 1 1 1 
// 2 1 2 3
// 3 1


// 2: (2)  (0 2) (1 1) 
// 3: (3) (0 3) + (1 2) (2 1)  
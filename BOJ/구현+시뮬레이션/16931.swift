// 겉넓이 구하기
// 시간 : 2시간

import Foundation

var matrix = readLine()!.components(separatedBy : " ")
let (n, m) = (Int(matrix[0])!, Int(matrix[1])!)
var g = [[Int]]() // graph
var ans = n * m * 2
for _ in 0..<n {
    let line = readLine()!.components(separatedBy : " ").map{Int(String(($0)))!}
    g.append(line)
}

// 좌, 우 겉넓이 구하기 -> 좌 겉넓이 * 2
for i in 0..<n {
    var tmpSum = 0 // 행별 합
    for j in 0..<m {
        if j == 0 {
            tmpSum += g[i][j]
        }
        // 현재 칸개수와 이전 칸 개수를 비교
        else if g[i][j - 1] < g[i][j] {
            tmpSum += g[i][j] - g[i][j - 1]
        }
    }
    ans += 2 * tmpSum
}

// 앞, 뒤 겉넓이 구하기 -> 앞 겉넓이 * 2
for j in 0..<m {
    var tmpSum = 0 // 열별 합
    for i in 0..<n {
        if i == 0 {
            tmpSum += g[i][j]
        }
        // 현재 칸 개수와 이전 칸 개수를 비교
        else if g[i - 1][j] < g[i][j] {
            tmpSum += g[i][j] - g[i - 1][j]
        }
    }
    ans += 2 * tmpSum
}
print(ans)

// Test Case
//3 3
//4 1 3
//2 2 2
//2 2 2
//
//답 : 56
//
//3 5
//4 3 1 3 4
//1 1 1 1 1
//1 1 1 1 1
//
//답 : 78

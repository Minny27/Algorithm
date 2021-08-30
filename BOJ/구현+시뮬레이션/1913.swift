// 달팽이
// 시간 : 50분

import Foundation

let n = Int(readLine()!)!
let targetNumber = Int(readLine()!)!
var g = Array(repeating: Array(repeating: -1, count: n), count: n)
var k = n * n - 1
var i = 0, j = 0
g[i][j] = n * n
var ans = [0, 0]

func boundary(_ i: Int, _ j: Int) -> Bool {
    return 0 <= i && i < n && 0 <= j && j < n
}

while k >= 1 {
    while boundary(i + 1, j) {
        if g[i + 1][j] == -1 {
            g[i + 1][j] = k
            i += 1
            k -= 1
            
        }
        else {
            break
        }
    }
    while boundary(i, j + 1) {
        if g[i][j + 1] == -1 {
            g[i][j + 1] = k
            j += 1
            k -= 1
        }
        else {
            break
        }
    }

    while boundary(i - 1, j) {
        if g[i - 1][j] == -1 {
            g[i - 1][j] = k
            i -= 1
            k -= 1
        }
        else {
            break
        }
    }
    
    while boundary(i, j - 1) {
        if g[i][j - 1] == -1 {
            g[i][j - 1] = k
            j -= 1
            k -= 1
        }
        else {
            break
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        if g[i][j] == targetNumber {
            ans = [i, j]
        }
        print(g[i][j], terminator: " ")
    }
    print()
}

print("\(ans[0] + 1) \(ans[1] + 1)")
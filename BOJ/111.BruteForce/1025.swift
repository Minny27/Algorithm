// 제곱수 찾기

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
var g = [[Int]]()
var ans = -1
for _ in 0..<n {
    let line = Array(readLine()!).map{Int(String($0))!}
    g.append(line)
}

func boundary(_ i: Int, _ j: Int) -> Bool {
    return 0 <= i && i < n && 0 <= j && j < m
}

for i in 0..<n {
    for j in 0..<m {
        for di in -n..<n {
            for dj in -m..<m {
                if di == dj && dj == 0 {
                    continue
                }
                var ni = i, nj = j
                var totalNum = ""
                while boundary(ni, nj) {
                    totalNum += String(g[ni][nj])
                    let tmpNum = sqrt(Double(totalNum)!)
                    if tmpNum.truncatingRemainder(dividingBy: 1) == 0 {
                        ans = max(ans, Int(totalNum)!)
                    }
                    ni += di
                    nj += dj
                }
            }
        }
    }
}
print(ans)

    

// 숫자 정사각형

import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
let minValue = min(n, m)
var graph = [[Int]]()
var ans = 0

for _ in 0..<n {
    let line = Array(readLine()!).map { Int(String($0))! }
    graph.append(line)
}



for k in 0...minValue {
    for i in k..<n {
        for j in k..<m {
            if graph[i][j] == graph[i - k][j] && graph[i - k][j] == graph[i][j - k] && graph[i][j - k] == graph[i - k][j - k] {
                ans = (k + 1) * (k + 1)
            }
        }
    }
}

print(ans)

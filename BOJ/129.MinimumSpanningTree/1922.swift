// 네트워크 연결

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var parent = Range(0...n).map { Int(String($0))! }
var q = [[Int]]()
var ans = 0

for _ in 0..<m {
    let line = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
    q.append([line[2], line[0], line[1]])
}

q.sort{ $0[0] < $1[0] }

func find(_ a: Int) -> Int {
    if parent[a] == a {
        return a
    }
    parent[a] = find(parent[a])
    return parent[a]
}

func union(_ a: Int, _ b: Int) -> Bool {
    let a = find(a)
    let b = find(b)
    
    if a == b {
        return false
    }
    
    parent[a] = b
    
    return true
}

for i in 0..<m {
    let (a,b) = (q[i][1], q[i][2])
    
    if union(a, b) {
        ans += q[i][0]
    }
}

print(ans)
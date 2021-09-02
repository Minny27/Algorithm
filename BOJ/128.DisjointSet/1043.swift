// 거짓말
// 시간 : 1시간 반

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
var trueGuys = Set<Int>(readLine()!.split(separator: " ").map{Int(String($0))!}[1...])
var graph = Array(repeating: [Int](), count: m) // 각 파티에 참여하는 사람 그래프
var ableToGoParty = Array(repeating: 1, count: m) // 지민이가 방문할 수 있는 파티
for i in 0..<m {
    let line: [Int] = Array(readLine()!.split(separator: " ").map{Int(String($0))!}[1...])
    graph[i].append(contentsOf: line)
}

for _ in 0..<m {
    for (i, visitedPersonArray) in graph.enumerated() {
        // 이미 방문할 수 없는 파티는 패스
        if ableToGoParty[i] == 0 {
            continue
        }
        
        // 거짓말인 것을 아는 사람들과 파티 동선이 겹칠 때마다 겹친 사람들을 set에 합치고 해당 파티는 갈 수 없음
        if trueGuys.intersection(visitedPersonArray) != [] {
            ableToGoParty[i] = 0
            trueGuys = trueGuys.union(visitedPersonArray)
        }
    }
}

print(ableToGoParty.reduce(0, +))
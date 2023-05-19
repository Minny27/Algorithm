// 과제 진행하기
// 문제 유형: 정렬, 시뮬레이션, 스택
// 느낀점: 이 문제의 포인트는 다음 작업의 start를 알아야 진행중이었던 작업의 진행도를 표시할 수 있음.
// 그리고 이전 작업 중 최근에 멈춘 작업을 먼저 실행한다고 했으니 stack을 사용해야하는 것이 포인트.
// 문제를 어떻게 해결할 지를 빠르게 인지해야한다..

import Foundation

func solution(_ plans:[[String]]) -> [String] {
    var answer = [String]()
    var plans = plans.map { (name: $0[0], start: hToM($0[1]), playTime: Int($0[2])!) }.sorted { $0.start < $1.start }
    var stack: [(name: String, start: Int, playTime: Int)] = [plans[0]]
    
    for i in 1..<plans.count {
        var diffTime = plans[i].start - plans[i - 1].start
        
        for j in stride(from: stack.count - 1, to: -1, by: -1) {
            let lastTask = stack[j]
            
            if lastTask.playTime <= diffTime {
                diffTime -= lastTask.playTime
                answer.append(lastTask.name)
                stack.removeLast()
            }
            else {
                stack[j].playTime -= diffTime
                break
            }
        }
        stack.append(plans[i])
    }
    
    for item in stack.reversed() {
        answer.append(item.name)
    }
    
    return answer
}

func hToM(_ h: String) -> Int {
    let split = h.components(separatedBy: ":").map { Int($0)! }
    let (h, m) = (split[0], split[1])
    return h * 60 + m
}

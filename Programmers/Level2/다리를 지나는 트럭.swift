// 다리를 지나는 트럭
// 문제 유형: 스택
// 풀이 방법: 
// 1. 다리, 트럭 배열을 각각 생성
// 2. while문을 통해서 다리에 첫 번째로 들어온 트럭의 시간이 다리의 길이와 일치하면 삭제
// 3. 트럭 배열에서 첫 트럭을 추가했을 경우, 다리의 무게를 넘지 않고, 다리의 길이를 넘지 않으면 추가
// 4. legs에 있는 모든 트럭의 시간 + 1
// 5. 시간 + 1
// 6. 2~5 반복
// 느낀 점: 종료 조건을 어떻게 처리해야 할 지에 대해 고민이 많았음.
// 처음에는 트럭 배열이 비어 있으면서, leg의 배열이 비어 있을 떄로 설정했었는데
// 처음 시작 시, legs 배열이 비어 있어서 원하는 방식대로 구현이 안 됐음
// 그래서 repeat while 문을 이용해서 풀이할 수 있었음. (do-while 문처럼 조건에 상관없이 한 번을 실행)

import Foundation

struct Truck {
    let weight: Int
    var time: Int
    
    mutating func move() {
        time += 1
    }
}

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var answer = 0
    var truckWeights = Array(truck_weights.reversed())
    var legs = [Truck]()
    var weightSum = 0
    
    repeat {
        if let first = legs.first, first.time == bridge_length {
            let first = legs.removeFirst()
            weightSum -= first.weight
        }
        
        if legs.count + 1 <= bridge_length {
            if let last = truckWeights.last, weightSum + last <= weight {
                let last = truckWeights.removeLast()
                let newItem = Truck(weight: last, time: 0)
                legs.append(newItem)
                weightSum += newItem.weight
            }
        }
        
        for i in 0..<legs.count {
            legs[i].time += 1
        }
        
        answer += 1
    } while !legs.isEmpty
    
    return answer
}


// 이전 풀이
// func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
//     var answer = 1
//     var truckWeights = Array(truck_weights.reversed())
//     var sum = 0
//     var stack = [[Int]]()
    
//     while true {
        
//         if !stack.isEmpty && stack.first![1] == bridge_length {
//             let first = stack.removeFirst()
//             sum -= first[0]
//         }
        
//         if stack.count + 1 <= bridge_length && sum + (truckWeights.last ?? 0) <= weight {
//             if !truckWeights.isEmpty {
//                 let next = truckWeights.removeLast()
//                 stack.append([next, 0])
//                 sum += next
//             } else {
//                 if stack.isEmpty { break }
//             }
//         }
        
//         for j in 0..<stack.count {
//             stack[j][1] += 1
//         }
        
        
//         answer += 1
//     }
    
//     return answer
// }
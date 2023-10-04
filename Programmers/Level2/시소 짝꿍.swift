// 시소 짝궁
// 문제 유형: 딕셔너리, 경우의 수
// 먼저 weights의 count가 100,000이기 때문에 O(n2)으로 문제를 풀 수 없다는 것을 인지했어야 함
// 풀이 방법을 몰라서 아이디어를 찾아봄
// O(nlogn) 또는 O(n)으로 풀이 해야함
// 특정 무게의 개수를 체크하기 위해 dictionary를 사용(default 파라미터로 기본값을 설정하는 것을 알게 됨)
// 처음에도 비슷하게 생각은 했지만, dict로 개수를 넣어서 특정 무게의 개수와 곱해서 값을 구하는 것을 생각하지 못했음..
// weightDict를 순회하면서 같은 값이면 n * (n-1) => 순열
// 그 후, 해당 값에서 곱으로 나올 수 있는 배수(예. 100 -> 150(1.5배), 200(2배))
// 배수 집합을 순회하면서 answer에 weightDict[k] + weightDict[k * mul]을 더해줌
// 리턴 시에는 순서를 고려하지 않기 때문에 2!을 나눠주고 Int64로 캐스팅

import Foundation

// 개선 코드
func solution(_ weights:[Int]) -> Int64 {
    var weightDict = [Double: Int]()
    var multis: [Double] = [2/3, 2/4, 3/2, 3/4, 4/2, 4/3] // 나올 수 있는 배수 집합
    var answer: Int = 0
    
    for weight in weights {
        weightDict[Double(weight), default: 0] += 1
    }

    for (k, v) in weightDict {
        answer += v * (v - 1) // 해당 수(key)와 같은 수일 때 경우의 수
        
        for multi in multis {
            answer += v * (weightDict[k * multi] ?? 0) // 해당 수(key)와 배수와의 경우의 수
        }
    }
    return Int64(answer) / 2 // 순서를 고려하지 않기 때문에 나누기 2
}

// 이전 풀이
//func solution(_ weights:[Int]) -> Int64 {
//    var weightDict = [Double: Int]()
//    var answer: Int64 = 0
//
//    for weight in weights {
//        if let _ = weightDict[Double(weight)] { weightDict[Double(weight)]! += 1}
//        else { weightDict[Double(weight)] = 1 }
//    }
//
//    for (k, v) in weightDict {
//        if weightDict[k] != nil { answer += Int64(weightDict[k]! * (weightDict[k]! - 1) / 2) }
//        if weightDict[k * 2] != nil { answer += Int64(weightDict[k]! * weightDict[k*2]!) }
//        if weightDict[k * Double(4) / Double(3)] != nil { answer += Int64(weightDict[k]! * weightDict[k*Double(4)/Double(3)]!) }
//        if weightDict[k * 3 / 2] != nil { answer += Int64(weightDict[k]! * weightDict[k*3/2]!) }
//    }
//
//    return answer
//}


// 실패 코드
//func solution(_ weights:[Int]) -> Int64 {
//    let dict: [Double: Int] = Dictionary(uniqueKeysWithValues: zip([1, 0.5, 0.25,  2, 3, 4, 1.5, Double(1)/Double(3), Double(2)/Double(3), Double(4)/Double(3), Double(3)/Double(4)], Array(repeating:0, count:11)))
//    var answer: Int64 = 0
//    for i in 0..<weights.count {
//        for j in i+1..<weights.count {
//            if let _ = dict[Double(weights[j]) / Double(weights[i])] {
//                answer += 1
//            }
//        }
//    }
//
//    return answer
//}

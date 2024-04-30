// 배열의 원소만큼 추가하기
// 느낀 점: flatMap, map 고차함수에 대한 이해가 아직 부족한 것 같다.. 정리하자

import Foundation

func solution(_ arr:[Int]) -> [Int] {
    return arr.flatMap { Array(repeating: $0, count: $0) }
}

// import Foundation

// func solution(_ arr:[Int]) -> [Int] {
//     var answer = [Int]()
//     for v in arr {
//         answer += Array(repeating: v, count: v)
//     }
//     return answer
// }
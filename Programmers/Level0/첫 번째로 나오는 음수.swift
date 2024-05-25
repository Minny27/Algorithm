// 첫 번째로 나오는 음수
// 느낀점: firstIndex(where: )) 함수가 있구나..

import Foundation

func solution(_ num_list:[Int]) -> Int {
    return num_list.firstIndex(where: { $0 < 0 }) ?? -1
}

// 이전 풀이
// func solution(_ num_list:[Int]) -> Int {
//     let numList = num_list.enumerated().filter { $0.element < 0 }
//     return numList.isEmpty ? -1 : numList[0].offset
// }
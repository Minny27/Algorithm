// 짝지어 제거하기
// 시간 : 50분

import Foundation

func solution(_ s:String) -> Int{
    let sArr = Array(s).map{String($0)}
    var nArr = [String]()
    
    for i in 0..<sArr.count {
        if nArr.count == 0 {
            nArr.append(sArr[i])
            continue
        }
        if nArr[nArr.count - 1] == sArr[i] {
            nArr.removeLast()
            continue
        }
       else {
           nArr.append(sArr[i])
       }
    }
    return nArr.count == 0 ? 1 : 0
}

// print(solution("baabaa")) // 답 : 1
// print(solution("cdcd")) // 답 : 0
// print(solution("a")) // 답 : 0
// print(solution("aabb")) // 답 : 1
// print(solution("bcaacb")) // 답 : 1
// print(solution("aba")) // 답 : 0
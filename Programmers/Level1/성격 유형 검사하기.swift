// 성격 유형 검사하기
// 문제 유형: 딕셔너리, 구현
// dict에 값을 모두 넣고 할까말까 하다가 들어올 때 마다 추가하는 방식으로 했다가
// 꺼낼 때 nil인지 아닌지 확인하는 코드가 너무 길어져서 Dictionary(uniqueKeysWithValues)로 init해서 사용..
// 역시 swift는 까다롭다..
// 미리만들어놔야하는 문제는 미리 만들어놓자!


import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var dict = Dictionary(uniqueKeysWithValues: zip(Array("RTCFJMAN"), Array(repeating: 0, count: 8)))
    var answer = ""
    
    for i in 0..<survey.count {
        let arr = survey[i].map { $0 }
        let s = arr[0]
        let e = arr[1]
        
        if (1...3).contains(choices[i]) {
            dict[s]! += 4 - choices[i]
            
        } else if (5...7).contains(choices[i]) {
            dict[e]! += choices[i] - 4
        }
    }
    
    answer += dict["R"]! >= dict["T"]! ? "R" : "T"
    answer += dict["C"]! >= dict["F"]! ? "C" : "F"
    answer += dict["J"]! >= dict["M"]! ? "J" : "M"
    answer += dict["A"]! >= dict["N"]! ? "A" : "N"    
    
    return answer
}
// 롤케이크 자르기
// 문제 유형: 자료구조(Dictionary)
// 풀이 시간: 10분
// 느낀점: dictionary는 도가 텄다
// 풀이 방법: topping의 길이가 1,000,000까지 이기 때문에 O(n) 풀어야 겠다고 생각함
// "어떤 토핑"이 "몇 개" 있는지를 파악하기 위해서는 dict를 사용해야 한다고 생각했음.
// 전체 토핑에 대해서 미리 endDict에 어떤 토핑이 몇 개있는 지 저장
// 전체 토핑을 반복하면서 startDict에 어떤 토핑이 몇 개있는 지 저장하면서
// endDict에 그 값이 있으면 1빼고, 뺀 값이 0이면 값을 삭제
// 그래서 startDict.count == endDict.count 이면 answer += 1

import Foundation

func solution(_ topping:[Int]) -> Int {
    var startDict = [Int:Int]()
    var endDict = [Int:Int]()
    var answer = 0
    
    for n in topping {
        endDict[n, default: 0] += 1
    }
    
    for n in topping {
        startDict[n, default: 0] += 1
        if let _ = endDict[n] {
            endDict[n]! -= 1
            if endDict[n]! == 0 {
                endDict.removeValue(forKey: n)
            }
        }
        if startDict.count == endDict.count { answer += 1 }
    }
    
    return answer
}
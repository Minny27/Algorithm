// 대충 만든 자판
// 문제 유형: 딕셔너리, 구현
// 느낀점: 딕셔너리를 생성할 때, [Int, Int] 타입으로 미리 만들어서
// char형을 int로 int를 char형을 구현하려고 해서 시간이 오래걸림.
// 그냥 [String: Int] 타입으로 만들고 옵셔널 바인딩을 이용했으면 훨씬 쉬웠을 것.
// 그리고 target 문자열의 중간에 없는 문자열이 나왔을 때, break를 해야하는 것을 생각을 못했었다..

import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var answer = [Int]()
    var dict = [String: Int]()
    
    for i in 0..<keymap.count {
        let k = Array(keymap[i]).map { String($0) }
        for j in 0..<k.count {
            if let value = dict[k[j]] {
                if j < value {
                    dict[k[j]] = j + 1
                }
            } else { dict[k[j]] = j + 1 }
        }
    }
    
    for target in targets {
        let strArray = Array(target).map { String($0) }
        var sum = 0
        for str in strArray {
            if let value = dict[str] {
                sum += value
            } else { sum = -1; break }
        }
        answer.append(sum)
    }
    return answer
}

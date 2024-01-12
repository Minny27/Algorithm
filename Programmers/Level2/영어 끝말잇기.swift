// 영어 끝말잇기
// 문제 유형: 수학
// 느낀점: 몫과 나머지로 푸는건가? 했다가 아닌가 싶어서 틀었었다.. 왜그랬을까
// 그리고 몫이 순회 횟수이고 나머지가 사람인데 왜 그걸 반대로 생각했을까

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var wSet: Set<String> = [words[0]]
    var answer = [0,0]

    for i in 1..<words.count {
        if wSet.contains(words[i]) || words[i-1].last! != words[i].first! {
            return [i % n + 1, i / n + 1]
        }
        wSet.insert(words[i])
    }

    return answer
}

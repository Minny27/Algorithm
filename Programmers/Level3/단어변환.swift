// 단어 변환

import Foundation

var ans = Int.max
var visited = [Bool]() // 방문 체크

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    visited = Array(repeating: false, count: words.count)
    dfs(begin, target, words, 0)
    
    return ans == Int.max ? 0 : ans // 변환할 수 있으면 ans, 변환할 수 없으면 0
}
    
func dfs(_ begin: String, _ target: String, _ words: [String], _ cnt: Int) {
    if begin == target {
        // ans를 작은 값으로 갱신
        ans = ans > cnt ? cnt : ans
        return
    }
    else {
        // begin을 기준으로 모든 단어를 방문
        for i in 0..<words.count {
            if visited[i] {
                continue
            }

            let beginArr = Array(begin).map{String($0)}
            let wordCache = Array(words[i]).map{String($0)}
            var numOfDifferent = 0

            // begin과 다음 단어 간 틀린 알파벳 개수 비교
            for j in 0..<beginArr.count {
                if beginArr[j] != wordCache[j] {
                    numOfDifferent += 1
                }
            }
            
            // 틀린 알파벳 개수가 하나일 때만 다음 단어를 방문 체크하고 다음 단어를 기준으로 dfs 시작
            if numOfDifferent == 1 {
                // begin이 target이 되는 방법이 여러 개가 될 수 있기 때문에 target 인덱스는 방문 체크를 하지 않고 그 이외에는 방문 체크
                visited[i] = words[i] == target ? false : true
                dfs(words[i], target, words, cnt + 1)
            }
        }
    }
}
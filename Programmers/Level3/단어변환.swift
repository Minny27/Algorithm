// 단어 변환

import Foundation

var ans = Int.max
var visited = [Bool]() // 방문 체크

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    visited = Array(repeating: false, count: words.count)
    dfs(begin, target, words, 0)
    
    return ans == Int.max ? 0 : ans // 변환할 수 있으면 ans, 변환할 수 없으면 0
}
    
func dfs(_ begin:String, _ target:String, _ words:[String], _ cnt:Int) {
    if begin == target {
        ans = ans > cnt ? cnt : ans
        return
    }
    else {
        // 한 단어를 기준으로 모든 단어를 방문
        for i in 0..<words.count {
            if visited[i] {
                continue
            }

            let beginArr = Array(begin).map{String($0)}
            let wordCache = Array(words[i]).map{String($0)}
            var numOfDifferent = 0

            // 시작 단어와 다음 단어 간 틀린 개수 비교
            for j in 0..<beginArr.count {
                if beginArr[j] != wordCache[j] {
                    numOfDifferent += 1
                }
            }
            
            // 틀린 단어의 개수가 하나일 때만 다음 단어를 방문 체크하고 다음 단어를 기준으로 dfs 시작
            if numOfDifferent == 1 {
                visited[i] = i == words.count - 1 ? false : true
                dfs(words[i], target, words, cnt + 1)
            }
        }
    }
}
// 피로도
// 문제 유형: dfs, 부르트포스
// 느낀점: 처음에 정렬 문제라고 생각했는데, 전체 경우의 수를 파악해야한다는 것을 더 일찍 파악했으면 좋았을듯.
// 풀이 방법: 일반적인 순열을 푸는 방식으로 품
// 여기서 최소 피로도보다 현재 피로도가 크거나 같을 때만 깊이 우선 탐색을 하도록 구현
// 그리고 최종 값은 루프를 돌 때마다(모든 경우의 수를 탐색하기 때문에) max값 갱신

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var answer = 0
    var visited = Array(repeating: false, count: dungeons.count)
    
    func dfs(_ k: Int, _ ans: Int) {
        answer = max(ans, answer)
        
        for i in 0..<dungeons.count {
            if visited[i] { continue }
            visited[i] = true
            let (m, v) = (dungeons[i][0], dungeons[i][1])
            if m <= k { dfs(k - v, ans + 1) }
            visited[i] = false
        }
    }
    
    dfs(0, k, 0)
    return answer
}

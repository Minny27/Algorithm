// 광물 캐기
// 문제 유형: 부르트포스, dfs, dict
// 문제 해석: 처음에 dfs 로직을 어떻게 구현해야 할 지 잘 몰랐음.
// 특정 곡괭이로 특정 광물에 캘 때의 피로도를 체크할 때 if-else로 했었는데 긴가민가 했고 다른 블로그의 로직을 참고했음
// dict array를 enumerated()로 반복할 수 있다는 것을 알게 됨
// 또한 백트래킹 조건으로 미네랄이 없을 때만 생각했는데, 곡괭이가 부족할 때도 고려해야 했음..

import Foundation

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    // 모든 경우의 수를 탐색하기 위한 깊이 우선 탐색 dfs
    // 파라미터는 depth 마다 저장해야 하는 곡괭이 배열, 미네랄 배열, 부분 결과 값
    func dfs(_ picks: [Int], _ minerals: [String], _ sum: Int) -> Int {
        // 백트래킹 조건 - 곡괭이가 없거나 미네랄이 없거나
        if picks.reduce(0, { $0 + $1 }) == 0 || minerals.isEmpty {
            return sum
        }

        // 처음 어떤 곡괭이를 선택했을 때 나올 수 있는 결과를 저장
        var result = [Int]()

        // 특정 곡괭이로 특정 광물을 캘 때의 피로도가 1:1로 매칭되니 딕셔너리를 사용
        for (index, value) in [["diamond": 1, "iron": 1, "stone": 1],
                               ["diamond": 5, "iron": 1, "stone": 1],
                               ["diamond": 25, "iron": 5, "stone": 1]].enumerated() {
            if picks[index] > 0 {
                var picksCopy = picks
                picksCopy[index] -= 1
                var mineralsCopy = minerals
                var sumCopy = sum

                // 현재 곡괭이로 5번 캐기
                // 캔 미네라를 없앨 때 0번째부터 없애면 실행 시간 효율이 떨어져서
                // reversed된 리스트를 받아서 뒤에서 부터 반복하는 형식으로 구현
                for i in stride(from: mineralsCopy.count - 1, to: mineralsCopy.count - 6, by: -1) {
                    if i == -1 { break }
                    if let value = value[minerals[i]] { sumCopy += value }
                    mineralsCopy.removeLast()
                }
                result.append(dfs(picksCopy, mineralsCopy, sumCopy))
            }
        }
        return result.min() ?? -1
    }
    return dfs(picks, minerals.reversed().map { String($0) }, 0)
}


// 광물 캐기
// 문제 유형: 부르트포스, dfs, dict
// 문제 해석: 

import Foundation

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    func excute(_ picks: [Int], _ minerals: [String], _ sum: Int) -> Int {
        if picks.reduce(0, { $0 + $1 }) == 0 || minerals.isEmpty {
            return sum
        }

        var result = [Int]()

        for (index, value) in [["diamond": 1, "iron": 1, "stone": 1],
                               ["diamond": 5, "iron": 1, "stone": 1],
                               ["diamond": 25, "iron": 5, "stone": 1]].enumerated() {
            if picks[index] > 0 {
                var picksCopy = picks
                picksCopy[index] -= 1
                var mineralsCopy = minerals
                var sumCopy = sum
                for i in stride(from: mineralsCopy.count - 1, to: mineralsCopy.count - 6, by: -1) {
                    if i == -1 { break }
                    if let value = value[minerals[i]] { sumCopy += value }
                    mineralsCopy.removeLast()
                }
                result.append(excute(picksCopy, mineralsCopy, sumCopy))
            }
        }
        return result.min() ?? -1
    }
    return excute(picks, minerals.reversed().map { String($0) }, 0)
}


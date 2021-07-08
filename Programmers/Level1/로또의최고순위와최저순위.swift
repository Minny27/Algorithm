// 로또의 최고 순위와 최저 순위
// 시간 : 15분

import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var winCount = 0
    var zeroCount = 0
    var maxValue = 0
    var minValue = Int.max
    let ht : [Int : Int] = [6 : 1, 5 : 2, 4 : 3, 3 : 4, 2 : 5, 1 : 6, 0 : 6]
    
    for lotto in lottos {
        if lotto == 0 {
            zeroCount += 1
            continue
        }
        for winNum in win_nums {
            if lotto == winNum {
                winCount += 1   
            }
        }
    }
    maxValue = ht[winCount + zeroCount]!
    minValue = ht[winCount]!
    return [maxValue, minValue]
}
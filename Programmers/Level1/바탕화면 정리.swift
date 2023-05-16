// 바탕화면 정리
// 문제 유형: 구현
// 느낀점: 좀 더 빠르게 문제를 이해해보자..

import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    var (minI, minJ) = (51, 51)
    var (maxI, maxJ) = (-1, -1)
    var wallpaper = wallpaper.map { Array($0) }
    
    for i in 0..<wallpaper.count {
        for j in 0..<wallpaper[0].count {
            if wallpaper[i][j] == "#" {
                (minI, minJ) = (min(minI, i), min(minJ, j))
                (maxI, maxJ) = (max(maxI, i), max(maxJ, j))
            }
        }
    }
    
    return [minI, minJ, maxI + 1, maxJ + 1]
}
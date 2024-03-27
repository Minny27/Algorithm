// 점의 위치 구하기

import Foundation

func solution(_ dot:[Int]) -> Int {
    let (x,y) = (dot[0],dot[1])
    return x > 0 && y > 0 ? 1 : x < 0 && y > 0 ? 2 : x < 0 && y < 0 ? 3 : 4
}
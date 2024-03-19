// 각도기

import Foundation

func solution(_ angle:Int) -> Int {
    return angle < 90 ? 1 : angle == 90 ? 2 : angle < 180 ? 3 : 4
}
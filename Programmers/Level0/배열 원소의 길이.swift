// 배열 원소의 길이

import Foundation

func solution(_ strlist:[String]) -> [Int] {
    return strlist.map { $0.count }
}
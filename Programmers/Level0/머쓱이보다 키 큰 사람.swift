// 머쓱이보다 키 큰 사람

import Foundation

func solution(_ array:[Int], _ height:Int) -> Int {
    return array.filter { $0 > height }.count
}
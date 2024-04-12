// 옷 가게 할인받기

import Foundation

func solution(_ price:Int) -> Int {
    return price < 100000 ? price : price < 300000 ? Int(Double(price) * 0.95) : price < 500000 ? Int(Double(price) * 0.9) : Int(Double(price) * 0.8)
}
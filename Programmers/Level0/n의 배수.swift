// n의 배수

import Foundation

func solution(_ num:Int, _ n:Int) -> Int {
    return num % n == 0 ? 1 : 0
}
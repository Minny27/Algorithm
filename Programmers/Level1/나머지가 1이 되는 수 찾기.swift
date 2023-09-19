// 나머지가 1이 되는 수 찾기
// 문제 유형: 구현
// 화이팅!!

import Foundation

func solution(_ n:Int) -> Int {
    if n % 2 == 1 { return 2 }
    for i in stride(from: 3, to: n, by: 2) {
        if n % i == 1 { return i }
    }
    return -1
}
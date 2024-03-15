// 짝수의 합
// 느낀점: Range나 ClosedRange나 둘 다 시퀀스이기 때문에 (0...n)에 바로 필터를 적용했어도 됐구나..
import Foundation

func solution(_ n:Int) -> Int {
    return (0...n).filter { $0 % 2 == 0 }.reduce(0, +)
}

// 이전 풀이
// func solution(_ n:Int) -> Int {
//     return Array(Range(0...n)).filter { $0 % 2 == 0 }.reduce(0, +)
// }

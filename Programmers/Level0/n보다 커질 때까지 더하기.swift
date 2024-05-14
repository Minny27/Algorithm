// n보다 커질 때까지 더하기
// 느낀점: 왜 reduce의 클로저를 생각 못했을까..

import Foundation

func solution(_ numbers:[Int], _ n:Int) -> Int {
    var answer = 0
    for number in numbers {
        answer += number
        if answer > n { break }
    }
    return answer
}

// 다른 사람 풀이

func solution(_ numbers:[Int], _ n:Int) -> Int {
    return numbers.reduce(0) { $0 > n ? $0 : $0 + $1 }
}
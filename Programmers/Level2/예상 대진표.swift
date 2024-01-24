// 예상 대진표
// 문제 유형: 수학
// 느낀점: 문제를 어떻게 풀어가야할 지 빠르게 떠오르지 않는 것을 보니 문제를 많이 풀어봐야할 듯..
// 풀이 방법: 최대로 나올 수 있는 수가 2^20이기 때문에 n 혹은 지수만큼의 수행을 해서 문제를 해결해야 겠다고 생각
// 지수와 관련됐다고 생각해서 군을 찾으려고 하고 log로 1번에 값이 나올 수 없을까 고민이 좀 길었음..
// 근데 결국 한 번을 이기면 최대 수가 반씩 줄어들기 때문에 이를 이용하면 되는 문제였음.
// 4 7
// 1 2 3 4 5 6 7 8
// 1 2 3 4 - 1
// 1 2 - 2
// 1 - 3

import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var (a, b) = (a, b)
    var answer = 0

    while a != b {
        a = Int(ceil(Double(a) / 2))
        b = Int(ceil(Double(b) / 2))
        answer += 1
    }

    return answer
}
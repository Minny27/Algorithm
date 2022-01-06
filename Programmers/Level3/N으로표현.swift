// N으로 표현

import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    var ans = -1
    
    var dp: [Set<Int>] = [[]]
    
    for i in 1..<9 {
        var nSet: Set<Int> = [continuity(N, i - 1)]
        
        for j in 1..<i {
            for k in dp[j] {
                for l in dp[i - j] {
                    nSet.insert(k + l)
                    nSet.insert(k * l)
                    
                    if k >= l  {
                        nSet.insert(k - l)
                    }
                    
                    if k != 0 && l != 0 {
                        nSet.insert(k / l)
                    }
                }
            }
        }
        
        if nSet.contains(number) {
            ans = i
            return ans
        }
        
        dp.append(nSet)
    }
    
    return -1
}

func continuity(_ n: Int, _ count: Int) -> Int {
    var count = count
    var total = n
    
    while count > 0 {
        total += n * Int(pow(10, Double(count)))
        count -= 1
    }
    
    return total
}

//func expression(_ n: Int, _ count: Int){
//    if abs(n) == number {
//        ans = ans == -1 ? count : min(ans, count)
//        return
//    }
//
//    if count > 8 {
//        return
//    }
//
//    if n < -9999999 || n > 9999999 {
//        return
//    }
//    if isContinuity(n) {
//        expression(n * 10 + N, count + 1)
//    }
//    expression(n + N, count + 1)
//    expression(n - N, count + 1)
//    expression(n * N, count + 1)
//    expression(Int(n / N), count + 1)
//}
//
//func isContinuity(_ n: Int) -> Bool {
//    let n = abs(n)
//    let stringN = String(n)
//    var length = stringN.count
//    let array = Array(stringN).map { Int(String($0))! }
//
//    while length > 0 {
//        if array[length - 1] % N == 0 {
//            length -= 1
//            continue
//        }
//
//        else {
//            return false
//        }
//    }
//
//    return true
//}

//print(solution(2, 11))
//print(solution(4, 0))
//print(solution(1, 32000))
//print(solution(5, 44))
//print(solution(5, 4))
//print(solution(8, 53))
//print(solution(1, 1))
//print(solution(1, 18))
print(solution(5, 12))
// 기사단원의 무기
// 문제 유형: 수학
// 처음에는 number를 1부터 number까지 반복하면서 number의 절반까지만 체크해도 
// 시간 초과가 발생하지 않을 것이라고 생각함...
// 그래서 prime number를 구하듯이 sqrt까지의 범위로 처리하니 해결됨
// 다른 사람들의 풀이를 보니 에라토스테네스의 체와 같이 특정 숫자의 배수에 모두 +1하고
// 해당 array를 map으로 값을 필터링 후, reduce하는 방식으로 하는 것이 더 효율적이고 직관적이라는 것을 배움

import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    func getNFactorArray() -> [Int] {
        var arr = Array(repeating: 0, count: number+1)
        for i in 1..<number+1 {
            var count = i
            while count <= number {
                arr[count] += 1
                count += i
            }
        }
        return arr
    }
    return getNFactorArray().map { $0 > limit ? power : $0 }.reduce(0, {$0+$1})
}

// 첫 번째 풀이
//func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
//
//    func getNFactorArray(_ n: Int) -> [Int] {
//        var arr = [1]
//        for i in 2..<n+1 {
//            var count = 0
//            for j in 1..<Int(sqrt(Double(i))+1) {
//                if i % j == 0 {
//                    count += 1
//                    if j*j != i {
//                        count += 1
//                    }
//                }
//            }
//            arr.append(count > limit ? power : count)
//        }
//        return arr
//    }
//    return getNFactorArray(number).reduce(0, {$0+$1})
//}

// 시간 초과 코드
//func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
//
//    if number == 1 { return 1 }
//
//    func getNFactorArray(_ n: Int) -> [Int] {
//        var arr = [1]
//        for i in 2...n {
//            var count = 1
//            for j in 1...Int(sqrt(Double(i))) {
//                if i % j == 0 { count += 1 }
//            }
//            arr.append(count > limit ? power : count)
//        }
//        return arr
//    }
//    return getNFactorArray(number).reduce(0, {$0+$1})
//}
//

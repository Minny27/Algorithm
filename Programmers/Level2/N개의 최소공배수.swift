// N개의 최소공배수
// 문제 유형: 수학
// 느낀점: 최소 공배수를 구한는 원리를 이해하고 있으면 공식으로 풀 수 있는 문제.
// 풀이 방법: 최소 공배수 = a * b / (a, b의 최대공약수) 로 구하기

// 두 수의 최대 공약수 구하기
func gcd(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : gcd(b, a % b)
}

// 두 수의 최소 공배수 구하기
func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

func solution(_ arr: [Int]) -> Int {
    var result = arr[0]
    
    for i in 1..<arr.count {
        result = lcm(result, arr[i])
    }

    return result
}
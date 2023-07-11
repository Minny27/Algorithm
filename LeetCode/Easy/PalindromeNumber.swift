// Palindrome Number
// 문제 유형: Stack, 구현
// 풀이 방법: 변수 x와 half를 정의. half에는 x 기준으로 반절을 거꾸로 저장하는 변수 정의하고, while문을 통해서 half보다 클 때를 기준으로
// half에 (half의 현재 값 * 10) + (x를 10으로 나눈 나머지)를 저장, x에는 x를 10으로 나눈 값 저장
// 예를 들어, 12321이면 while문이 끝났을 때, x = 12, half = 123이 되어 x == half / 10 조건 만족
// 2112이면 while문이 끝났을 때, x = 21, half = 21이 되어 x == half 조건 만족
// 이렇게 구현하면 n / 2 번의 실행과 메모리도 x, half 두 개만 사용하게 되어 굉장히 효율적임
// 느낀점: 처음에는 Stack을 쓰는데 급급했지만 풀이 후,
// 다른 사람의 풀이를 보니 훨씬 더 속도나 메모리적으로 효율적인 풀이를 보고 놀랐음...
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 && (x == 0 || x % 10 != 0) else { return false }

        var x = x
        var half = 0
        while x > half {
            half = half * 10 + x % 10
            x = x / 10
        }
        return x == half || x == half / 10
    }
}

// 이전 풀이
// stack을 이용한 구현
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        let stringArray = Array(String(x))
        var stack = [Character]()

        for i in 0..<stringArray.count {
            if stringArray.count % 2 != 0 && i == stringArray.count / 2 {
                continue
            }

            if i < stringArray.count / 2 {
                stack.append(stringArray[i])
            } else {
                if let value = stack.popLast() {
                    if value != stringArray[i] {
                        return false
                    }
                }
            }
        }
        return true
    }
}

// array의 reversed를 이용한 구현
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 || x % 10 != 0 else { return false }
        let stringArray = Array(String(x))
        return stringArray == stringArray.reversed()
    }
}
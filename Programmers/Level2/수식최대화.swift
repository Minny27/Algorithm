// 수식 최대화
// 시간 : 2시간
import Foundation

func solution(_ expression:String) -> Int64 {
    var ans = 0
    // 연산자 우선순위 조합으로 나올 수 있는 모든 경우의 수를 해시 테이블로 저장
    let ht = [0 : ["*", "+", "-"], 1 : ["*", "-", "+"], 2 : ["+", "*", "-"], 3 : ["+", "-", "*"], 4 : ["-", "+", "*"], 5 : ["-", "*", "+"]]
    var expressionArr = [String]()
    var tmpValue = ""
    // 연산자와 피연산자를 구분해서 expressionArr에 저장
    for (idx, value) in expression.enumerated() {
        if value.isNumber {
            tmpValue += String(value)
            if idx == expression.count - 1 {
                expressionArr.append(tmpValue)
            }
        }
        else {
            expressionArr.append(tmpValue)
            expressionArr.append(String(value))
            tmpValue = ""
        }
    }
    
    // 전체 경우의 수 실행하는 for문
    for key in 0..<6 {
        var expressionArrCopy = expressionArr
        for operIdx in 0..<3 {
            var idx = 0
            for value in expressionArrCopy {
                // 연산자를 찾으면 해당 연산자가 포함된 식의 2번째 피연산자에 값을 갱신
                if ht[key]![operIdx] == value {
                    if value == "*" {
                        expressionArrCopy[idx + 1] = String(Int(expressionArrCopy[idx - 1])! * Int(expressionArrCopy[idx + 1])!)
                    }
                    else if value == "+" {
                        expressionArrCopy[idx + 1] = String(Int(expressionArrCopy[idx - 1])! + Int(expressionArrCopy[idx + 1])!)
                    }
                    else if value == "-" {
                        expressionArrCopy[idx + 1] = String(Int(expressionArrCopy[idx - 1])! - Int(expressionArrCopy[idx + 1])!)
                    }
                    // 첫 번째 피연산자와 연산자를 remove하고 idx도 -2해주기
                    expressionArrCopy.remove(at: idx - 1)
                    expressionArrCopy.remove(at: idx - 1)
                    idx -= 2
                }
                idx += 1
            }
        }
        // 5가지 경우의 수를 모두 탐색하면서 가장 큰 절대 값을 ans에 저장
        ans = max(ans, abs(Int(expressionArrCopy[0])!))
    }
    return Int64(ans)
}

print(solution("100-200*300-500+20"))
print(solution("50*6-3*2"))
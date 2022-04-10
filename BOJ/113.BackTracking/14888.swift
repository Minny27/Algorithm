// 연산자 끼워넣기

// 0: +, 1: -, 2: *. 3: /
typealias Data = (index: Int, count: Int)

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int(String($0))! }
let operatorNum = readLine()!.split(separator: " ").enumerated().map { Data($0, Int(String($1))!) }
var OperatorArray = [Int]()
var visited = Array(repeating: false, count: n)
var maxValue = Int.min
var minValue = Int.max

for data in operatorNum {
    OperatorArray += Array(repeating: data.index, count: data.count)
}

func permu(_ result: Int, _ count: Int) {
    if count == n - 1 {
        maxValue = max(maxValue, result)
        minValue = min(minValue, result)
        return
    }
    
    for i in 0..<n-1 {
        if !visited[i] {
            visited[i] = true
            switch OperatorArray[i] {
            case 0: permu(result + array[count + 1], count + 1)
            case 1: permu(result - array[count + 1], count + 1)
            case 2: permu(result * array[count + 1], count + 1)
            default: permu(result / array[count + 1], count + 1)
            }
            visited[i] = false
        }
    }
}

permu(array[0], 0)
print(maxValue)
print(minValue)

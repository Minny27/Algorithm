// 수열

let data = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = data[0]
let k = data[1]
var array = [Int]()
var answer = -Int.max

for i in 0..<1 {
    array = readLine()!.split(separator: " ").map { Int(String($0))! }
}

func twoPointer() {
    var i = 0
    var count = 1
    var subSum = 0
    
    while i < array.count {
        if count <= k {
            subSum += array[i]
            
            if count == k {
                answer = max(answer, subSum)
                count -= 1
                subSum -= array[i - k + 1]
            }
        }
        count += 1
        i += 1
    }
    print(answer)
}

twoPointer()

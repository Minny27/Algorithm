// 잃어버린 괄호

let array = readLine()!.split(separator: "-").map { String($0) }
var sum = 0

for (index, item) in array.enumerated() {
    let subSum = item.split(separator: "+").map { Int($0)! }.reduce(0, +)
    
    if index == 0 {
        sum += subSum
    } else {
        sum -= subSum
    }
}

print(sum)

// 반례
//55+50-40+30-30
//
//답: 5
//
//55+50-40-30-30
//
//답: 5

// 양팔저울

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
let sum = arr.reduce(0, +)
var resultSet = Set<Int>(Array(Range(1...sum)))

func dfs(_ index: Int, _ totalSum: Int) {
    if totalSum > sum {
        return
    }
    
    if n == index {
        resultSet.remove(totalSum)
        return
    }
    
    dfs(index + 1, totalSum)
    dfs(index + 1, totalSum + arr[index])
    dfs(index + 1, abs(totalSum - arr[index]))
    
}

dfs(0, 0)
print(resultSet.count)
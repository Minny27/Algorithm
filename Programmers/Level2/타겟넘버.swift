// 타겟 넘버
// 시간 : 1시간

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    let numbers = numbers
    var ans = 0
    
    func dfs(_ index: Int, _ sum: Int) {
        if index == numbers.count {
            if sum == target {
                ans += 1
            }
            return
        }
                
        else {
            dfs(index + 1, sum + numbers[index])
            dfs(index + 1, sum - numbers[index])
        }
    }
    dfs(0, 0)
    return ans
}

print(solution([1,1,1,1,1], 3))
print(solution([1,2,3], 6))
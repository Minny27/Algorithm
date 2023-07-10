// 3Sum
// 문제 유형: 2포인터
// 느낀점: 처음에 dict로 해결할 수 있을거라고 생각했지만 안 됐고, 투포인터에 Binary Search인가 싶어서 시도했지만
// 잘 되지 않았음.. 더 많이 풀어보자..

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var answer = Set<[Int]>()

        for i in 0..<nums.count - 1 {
            var (s, e) = (i + 1, nums.count - 1)
            while s < e {
                let sum = nums[i] + nums[s] + nums[e]
                if sum == 0 {
                    answer.insert([nums[i], nums[s], nums[e]])
                    s += 1
                    e -= 1
                } else if sum < 0 {
                    s += 1
                } else {
                    e -= 1
                }
            }
        }
        return Array(answer)
    }
}
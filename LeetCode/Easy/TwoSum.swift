// Two Sum
// 문제 유형: 구현, 자료구조(dict)
// 느낀점: 이 문제를 투포인터라고 생각하고 접근하다니...
// O(n2)에서 O(n)으로 개선하는 방법에 대해서 생각해보기

// O(n)
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()

        for (index, value) in nums.enumerated() {
            if let startIndex = dict[target - value] {
                return [startIndex, index]
            } else {
                dict[value] = index
            }
        }
        return []
    }
}

// O(n2)
// class Solution {
//     func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//         for i in 0..<nums.count - 1 {
//             for j in i+1..<nums.count {
//                 if nums[i] + nums[j] == target {
//                     return [i, j]
//                 }
//             }
//         }
//         return [0, 1]
//     }
// }
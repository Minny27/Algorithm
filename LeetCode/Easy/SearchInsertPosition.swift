// Search Insert Position
// 문제 유형: 이분 탐색
// 느낀점: 이분 탐색도 더 많이 풀어봐야할 것 같다..

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if let value = binarySearch(nums, target: target) {
            return value
        } else {
            return -1
        }
    }
}

func binarySearch<T: Comparable>(_ array: [T], target: T) -> Int? {
    var (l, r) = (0, array.count - 1)

    while l <= r {
        let m = (l + r) / 2
        if array[m] == target {
            return m
        } else if array[m] < target {
            l = m + 1
        } else {
            r = m - 1
        }
    }
    return l
}
// 수 찾기

let n = Int(readLine()!)!
var numberArray = readLine()!.split(separator: " ").map{ Int(String($0))! }.sorted()
let m = Int(readLine()!)!
let searchArray = readLine()!.split(separator: " ").map{ Int(String($0))! }
var answer = [Int]()

func solution() {
    searchArray.forEach {
        answer.append(bisect(numberArray, $0))
    }
    
    answer.forEach {
        print($0)
    }
}

func bisect<T: Comparable>(_ array: [T], _ item: T) -> Int {
    var low = 0
    var high = array.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        let midItem = array[mid]
        
        if midItem == item {
            return 1
        } else if midItem > item {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return 0
}

solution()

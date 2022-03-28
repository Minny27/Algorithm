// 친구비

let data = readLine()!.split(separator: " ").map { Int(String($0))!}
let (n, m, k) = (data[0], data[1], data[2])
let costArray = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
var parent = Array(Range(0...n))
var parentList = Set<Int>()

func solution() {
    for _ in 0..<m {
        let edgeData = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (start, end) = (edgeData[0], edgeData[1])
        
        union(start, end)
    }

    for i in 1...n {
        let root = find(parent[i])
        parentList.insert(root)
    }
    
    var sum = 0
    parentList.forEach {
        sum += costArray[$0]
    }
    
    if sum > k {
        print("Oh no")
    } else {
        print(sum)
    }
}

func find(_ a: Int) -> Int {
    if a == parent[a] {
        return a
    }
    return find(parent[a])
}

func union(_ a: Int, _ b: Int) {
    let a = find(a)
    let b = find(b)
    
    if a == b { return }
    
    if costArray[a] < costArray[b] {
        parent[b] = a
    } else {
        parent[a] = b
    }
}

solution()

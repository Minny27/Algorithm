// 디펜스 게임
// 문제 유형: 그리디, 우선순위 큐
// 음.. 일단 enemy 개수가 1,000,000이기 때문에 O(n), O(nlogn)으로 풀어야하는 문제
// 근데 힙큐를 안 쓰고는 도저히 풀이가 생각이 안 남
// heap를 복붙해서 씀
// enemy를 순회하면서 max heap에 넣고 현재 보유한 병사에서 enemy[i]를 뺌
// heap에 있는 값의 합보다 n이 작으면 heap에 있는 가장 큰 값을 무적권으로 막기
// heap에서 remove하고 remove한 값을 다시 n에 더하고 answer += 1, k -= 1
// 그러다가 무적권을 다 쓰고 현재의 enemy보다 n이 작으면 break
// 답은 answer(무적권 사용 개수) + heap의 크기
// 실제 문제에서 heapq가 나오면 어쩌지..?

import Foundation

// max heap
struct Heap<T: Comparable> {
    var heap: Array<T> = []
    
    var first: T? {
        return heap.isEmpty ? nil : heap[0]
    }
    
    var count: Int {
        return heap.count
    }
    
    var isEmpty: Bool {
        return heap.count < 1 ? true : false
    }
        
    init(array: Array<T>) {
        array.forEach { element in
            insert(element)
        }
    }
    
    private func getLeftChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 1
    }
    
    private func getRightChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 2
    }
    
    private func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }
    
    private func hasLeftChild(_ index: Int) -> Bool {
        return heap.count > getLeftChildIndex(index)
    }
    
    private func hasRightChild(_ index: Int) -> Bool {
        return heap.count > getRightChildIndex(index)
    }
    
    private func hasParent(_ index: Int) -> Bool {
        return getParentIndex(index) >= 0
    }
    
    mutating private func siftUp() {
        var index = heap.count - 1
        
        while hasParent(index) && heap[getParentIndex(index)] < heap[index] {
            let parentIndex = getParentIndex(index)
            heap.swapAt(parentIndex, index)
            index = parentIndex
        }
    }
    
    mutating func insert(_ element: T) {
        heap.append(element)
        siftUp()
    }
    
    mutating private func siftDown() {
        var index = 0
        
        while hasLeftChild(index) {
            let leftChildIndex = getLeftChildIndex(index)
            let rightChildIndex = getRightChildIndex(index)

            var biggerChildIndex = leftChildIndex
            
            if hasRightChild(index) && heap[leftChildIndex] < heap[rightChildIndex] {
                biggerChildIndex = rightChildIndex
            }
            
            if heap[index] > heap[biggerChildIndex] { break }
            
            heap.swapAt(index, biggerChildIndex)
            index = biggerChildIndex
        }
    }
    
    mutating func remove() {
        if isEmpty { return }
        
        let lastChildIndex = heap.count - 1
        heap.swapAt(0, lastChildIndex)
        heap.removeLast()
        siftDown()
    }
}

func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    var n = n
    var nk = k
    var h = Heap<Int>(array: [])
    var answer = 0
    
    for i in 0..<enemy.count {
        if n < enemy[i] && nk == 0 { break }
        h.insert(enemy[i])
        n -= enemy[i]
                
        // heap에 있는 값의 합보다 n이 작으면 heap에 있는 가장 큰 값을 무적권으로 막기
        if n < 0 {
            n += h.first ?? 0
            h.remove()
            nk -= 1
            answer += 1
        }
    }    
    
    return enemy.count <= k ? enemy.count : answer + h.count
}
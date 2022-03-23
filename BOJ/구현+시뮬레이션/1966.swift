// 프린터 큐
// 0: 1 1: 2 2: 3 3: 4
// 3: 4 2: 3 1: 2 0: 1

// 0: 1 1: 1 2: 9 3: 1 4: 1 5: 1
// 2: 9

// 1. 현재 작업보다 우선순위가 높은지 판별 -> 힙이 최적으로 생각되나 heap 구현 오래걸림.. array에서 값 역정렬 후, 
// 2. 크면 삭제 후 append 
// 3. 작거나 같으면 찾으려는 작업이랑 비교해서 일치하면 count 출력
// 4. count + 1

var n = 0, index = 0
var tasks = [Int]()
var answers = [Int]()

func inputCase() {
    let data = readLine()!.split(separator: " ").map { Int(String($0))! }
    n = data[0]
    index = data[1]
    tasks = readLine()!.split(separator: " ").map { Int(String($0))! }
}

func go() -> Int {
    var count = 1
    var dictArray = [[Int: Int]]()
    
    for i in 0..<tasks.count {
        dictArray.append([i: tasks[i]])
    }
    
    var reversePriority = tasks.sorted(by: >)
    
    while true {
        for data in dictArray {
            for (k, v) in data {
                if v == reversePriority[0] {
                    reversePriority.removeFirst()
                    dictArray.removeFirst()
                    
                    if k == index {
                        return count
                    }
                    
                    count += 1
                } else {
                    dictArray.append(dictArray.removeFirst())
                }
            }
        }
    }
    return count
}

func printAnswer() {
    for answer in answers {
        print(answer)
    }
}

func solution() {
    let numOfcase = Int(readLine()!)!
    for _ in 0..<numOfcase {
        inputCase()
        answers.append(go())
    }
    printAnswer()
}

solution()

// 반례
// 1
// 3 1
// 1 1 1

// 답: 2

// 1
// 5 1
// 1 2 3 1 2

// 답: 3

// 1
// 5 0
// 1 2 3 1 2

// 답: 5

// 위의 예시 설명
// 3 1 2 1 2 (2)
// 2 1 2 1 (4)
// 2 1 1 (1)
// 1 1 (3)
// 1 (0)

// 1
// 5 3
// 1 2 3 1 2

// 답: 4
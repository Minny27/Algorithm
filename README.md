## 알고리즘 문제를 풀 때 자주 사용하는 문법
[1. 입력](#입력)  
[2. 문자열 나누기](#문자열-나누기)  
[3. 그래프 생성](#그래프-생성)  
[4. 타입 생성](#타입-생성)  
[5. 정렬](#정렬)  
[6. 출력](#출력)

### 입력
* **정수 하나** 
    ```swift
    let number = Int(readLine()!)!
    ```

* **문자열 한 줄** 
    ```swift
    let string = readLine()!
    ```

* **n개의 줄, 정수 하나씩 입력받을 때**
    ```swift
    let n = Int(readLine()!)!
    var intArray = [Int]()

    for i in 0 ..< n {
        let value = Int(readLine()!)!
        intArray.append(value)
    }

    또는

    var intArray = [Int](repeating: 0, count: n)

    for i in 0 ..< n {
        let value = Int(readLine()!)!
        intArray[i] = value
    }

    또는

    let n = Int(readLine()!)!
    var intArray =  (0 ..< n).compactMap { _ in Int(readLine()!) }
    ```

<br>

### 문자열 나누기
```swift
let numberArray = readLine()!.split(separator: " ").map { Int(String($0))! }

또는

import Foundation
let numberArray = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
/* Int(String($0))! 로 쓰는 이유는 Int($0)! 보다 속도가 더 빠르기 때문 */
```

<br>

> ### 2차원 배열
* **띄어쓰기, 정수**
    ```swift
    var numberArray = [[Int]]()
    for _ in 0..<3 {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        numberArray.append(line)
    }
    ```

* **띄어쓰기, 문자열**
    ```swift
    var stringArray = [[String]]()
    for _ in 0..<3 {
        let line = readLine()!.split(separator: " ").map { String($0) }
        stringArray.append(line)
    }
    ```

* **띄어쓰기 x, 1차원 문자열 -> 2차원 정수**
    ```swift
    let stringArray = ["010", "0001", "0101"]
    var array = [[Int]]()
    for string in stringArray {
        var line = [Int]()
        for char in string {
            line.append(Int(String(char))!)
        }
        array.append(line)
    }

    또는

    for string in stringArray {
        let line = Array(string).map { Int(String($0))! }
        array.append(line)
    }

    또는

    stringArray.forEach {
        let line = Array($0).map { Int(String($0))! }
        array.append(line)
    }
    ```

* **띄어쓰기 x, 1차원 문자열 -> 2차원 문자열**
    ```swift
    let stringArray = ["Hi", "there", "bye!"]
    var array = [[String]]()
    for string in stringArray {
        var line = [String]()
        for char in string {
            line.append(String(char))
        }
        array.append(line)
    }

    또는

    for string in stringArray {
        let line = Array(string).map { String($0) }
        array.append(line)
    }

    또는

    stringArray.forEach {
        let line = Array($0).map { String($0) }
        array.append(line)
    }
    ```

<br>

### 그래프 생성
* **두 노드의 연결을 띄어쓰기로 주어졌을 때**
    ```swift
    /* 양방향 기준 */
    let n = Int(readLine()!)!
    var g = Array(repeating: [Int](), count: n + 1)

    for _ in 0..<n! {
        let adj = readLine()!.split(separator: " ").map{Int($0)!}
        g[adj[0]].append(adj[1])
        g[adj[1]].append(adj[0])
    }
    ```

<br>

### 타입 생성
* **Typealias**
    ```swift
    // typealias로 모델을 생성하면 파라미터 이름을 쓰지 않아도 됨.
    typealias Data = (prior: Int, index: Int)

    var array: [Data] = readLine()!.split(separator: " ").enumerated().map { (Int($1)!, $0) }
    ```

* **구조체**
    ```swift
    struct DataType {
        var prior: Int
        var index: Int
    
        init(_ prior: Int, _ index: Int) {
            self.prior = prior
            self.index = index
        }
    }

    var array: [DataType] = readLine()!.split(separator: " ").enumerated().map { DataType(Int($1)!, $0) }
    ```
    
### 정렬
* **1차원 배열**
    ```swift
    var array: [Int] = [5, 3, 1, 4]

    /* 오름차순 */
    array.sort()
    array.sort(by: <)
    array.sort{ $0 < $1 }
    
    /* 내림차순 */
    array.sort(by: >)
    array.sort{ $0 > $1 }
    ```

* **2차원 배열**
    ```swift
    var array: [[Int]] = [[5, 1], [2, 4], [3, 5], [3, 2]]

    /* 배열의 두 번째 인덱스 값을 기준으로 내림차순 정렬 */
    array.sort { $0[1] > $1[1] }

    /* 배열의 첫 번째 인덱스 값 오름차순 정렬 후, 같은 값은 두 번째 인덱스 값 내림차순 정렬 */
    array.sort { ($0[0], $1[1]) < ($1[0], $0[1]) }
    array.sort(by: { ($0[0], $1[1]) < ($1[0], $0[1]) })
    ```
    
# 출력

> ### 2차원 배열
* **정수 - 열은 띄어쓰고 다음 행은 new line**
    ```swift
    let numberArray : [[Int]] = [[1,2,3], [4,5,6]]
    for i in numberArray {
        for j in i {
            print(j, terminator: " ")
        }
        print()
    }

    또는

    numberArray.forEach {
        $0.forEach { print($0, terminator: " ") }
        print()
    }

    또는

    for line in numberArray {
        print(line.map { String($0) }.joined(separator: " "))
    }

    또는

    numberArray.forEach {
        print($0.map { String($0) }.joined(separator: " "))
    }
    ```

* **문자열 합쳐서 출력**
    ```swift
    let stringArray : [[String]] = [["a","b","c"], ["d","e","f"]]
    for string in stringArray {
        print(string.joined())
    }

    stringArray.forEach {
        print($0.joined(separator: ""))
    }
    ```

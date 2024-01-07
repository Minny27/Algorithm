## 알고리즘 문제를 풀 때 자주 사용하는 문법
[1. 딕셔너리](#딕셔너리)  
[2. 문자열](#문자열)  
[3. 정렬](#정렬)  
[4. 연산](#연산)  
[5. 타입 생성](#타입-생성)  
[6. 형변환](#형변환)  
[7. 반복](#반복)  
[8. 그래프 생성](#그래프-생성)  
[9. 고급 연산자](#고급-연산자)  
[10. 진수](#진수)

<br>

### 딕셔너리
* **기본**
    ```swift
    /* 선언 */
    var dict = [String: Int]()

    /* 할당 */
    dict["A"] = 0

    /* 키에 대한 기본값을 0으로 주고 특정 문자열이 나올 때마다 +1 */
    for str in ["a","b","c"] {
        dict[str, default: 0] += 1
    }
    print(dict) // ["a": 1, "b": 1, "c": 1]

    /* 꺼내기 */
    let value = dict["A"] ?? 0 // key가 없는 경우, nil을 리턴하기 때문에 ??으로 처리.

    /* 특정 value 기준 key 꺼내기 */
    let dict = [1:2, 2:2, 3:4]
    var answer = [Int]()
    for (k, v) in dict {
        if v == 2 { answer.append(k) }
    }
    print(answer) // [1, 2]
    ```

* **응용**
    ```swift
    /* 선언된 키에 번호 매기기 */
    let fruit = ["apple", "banana", "melon"]
    let dict = Dictionary(uniqueKeysWithValues: zip(fruit, 0..<3))
    // ["apple": 0, "banana": 1, "melon": 2]

    /* 번호 키에 모든 값 0으로 할당 */
    let dict = Dictionary(uniqueKeysWithValues: zip(0..<3, Array(repeating: 0, count: 3)))
    // [0: 0, 1: 1, 2: 2]
    
    /* 키에 값을 array로 그룹핑 */
    let dict = Dictionary(grouping: fruit) { $0 }
    // ["apple": ["apple"], "banana": ["banana"], "melon": ["melon"]]
    ```

<br>

### 문자열
* **Hour to Second**
    ```swift
    import Foundation

    func hToSecond(_ h: String) -> Int {
        let split = h.components(separatedBy: ":")
        let h = (Int(split[0]) ?? 0) * 60 * 60
        let m = (Int(split[1]) ?? 0) * 60
        let s = (Int(split[2]) ?? 0)
        return h + m + s
    }
    print(hToSecond("1:01:06")) // 3666
    ```

* **String -> String Array**
    ```swift
    let name = "Seungmin"
    let nameArray = name.map { String($0) } // 각 요소를 String으로 형변환하지 않으면 Character 타입이 됨
    print(nameArray) // ["S","e","u","n","g","m","i","n"]
    ```

* **String Array -> String**
    ```swift
    let nameArray = ["S","e","u","n","g","m","i","n"]
    let name = nameArray.joined()
    print(name) // Seungmin

    또는

    let name = nameArray.reduce("", +)
    print(name) // Seungmin
    ```

* **String Array -> String 띄어쓰기 적용**
    ```swift
    let array = ["a", "b", "c"]
    
    print(array.joined(separator: " ")) // a b c
    ```
    
* **문자열을 다른 문자열로 바꾸기**
    ```swift
    import Foundation
    
    var fruit = "bananaApple"
    fruit = fruit.replacingOccurrences(of: "banana", with: "pine")
    print(fruit) // pineApple
    ```
    
* **모든 문자열이 특정 문자열인지 확인하기**
    ```swift
    var allA = "AAAAAA"
    if allA.allSatisfy({ $0 == "A" }) {
        print("All A!") // All A!
    }
    ```
    
* **String Array -> Two Dimensional String Array**
    ```swift
    let stringArray = ["010", "0001", "0101"]
    var array = stringArray.map { $0.map { String($0) } }
    print(array) // [["0","1","0"], ["0","0","0","1"], ["0","1","0","1"]]
    ```

* **Two Dimensional String Array -> String**
    ```swift
    let array = [["0","1","0"], ["0","0","0","1"], ["0","1","0","1"]]
    print(array.map { $0.joined() }.joined()) // 01000010101
    ```

* **문자열 반복**
    ```swift
    let str = "Hi!"
    let strs = String(repeating: str, count: 5)
    print(strs) // Hi!Hi!Hi!Hi!Hi!
    ```

* **문자열이 알파벳인지 판별하는 변수 isAlpha 구현**
    ```swift
    extension String {
        var isAlpha: Bool {
            self.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil
        }
    
        또는
        
        var isAlpha: Bool {
            guard let value = Character(self).asciiValue else { return false }
            if (value >= 65 && value <= 90) || (value >= 97 && value <= 122) { return true }
            else { return false }
        }
    }

    let letter = "%"
    print(letter.isAlpha) // false
    ```

* **첫 번째 문자열을 대문자로 변경하는 변수 firstCharUppercase 구현**
    ```swift
    extension StringProtocol {
        var firstCharUppercase: String {
            guard let first = first else { return "" }
            return String(first).uppercased() + dropFirst()
        }
    }
    
    let word = "hello!"
    print(word.firstCharUppercase) // Hello!
    ```    

<br>
    
### 정렬
* **1차원 배열**
    ```swift
    var array: [Int] = [5, 3, 1, 4]

    /* 오름차순 */
    array.sort()
    array.sort(by: <)
    array.sort{ $0 < $1 }
    ```

* **2차원 배열**
    ```swift
    var array: [[Int]] = [[5, 1], [2, 4], [3, 5], [3, 2]]

    /* 배열의 두 번째 인덱스 값을 기준으로 내림차순 정렬 */
    array.sort { $0[1] > $1[1] }

    /* 배열의 첫 번째 인덱스 값 오름차순 정렬 후, 같은 값은 두 번째 인덱스 값 내림차순 정렬 */
    array.sort { ($0[0], $1[1]) < ($1[0], $0[1]) }
    ```

<br>

### 연산
* **제곱수**
    ```swift
    import Foundation // Foundataion을 꼭 import 해야함
    // 연산하는 타입은 모두 Double이라는 걸 명심!
    
    let value: double = 100.0
    print(pow(value, 2.0)) // 10000.0
    ```

* **제곱근**
    ```swift
    let value: double = 100.0
    print(sqrt(value, 2.0)) // 10.0
    ```

<br>

### 타입 생성
* **Typealias**
    ```swift
    // typealias로 모델을 생성하면 객체를 생성할 때, 파라미터 이름을 쓰지 않아도 됨.
    // 그러나 .0 .1로 접근해야하기 때문에 가독성이 떨어짐.
    typealias Point = (Int, Int)
    let point = Point(0, 0)
    print(point.0, point.1) // 0, 0
    ```

* **구조체**
    ```swift
    // init에 argument label을 '_'로 줘서 typealias처럼 사용할 수 있음
    // 그러나 구현 시간이 typealias보다 오래 걸림
    struct Point {
      let i: Int
      let j: Int
      
      init(_ i: Int, _ j: Int) {
        self.i = i
        self.j = j
      }
    }
    let point = Point(0, 0)
    print(point.i, point.j) // 0 0
    ```

<br>

### 형변환
* **Character -> Int**
    ```swift
    let str = "a"
    let intValue = Character(str).asciiValue!
    ```

* **Character -> Int**
    ```swift
    let n = 65
    let stringValue = Character(UnicodeScalar(n)!)
    ```

<br>

### 반복
* **문자열 합쳐서 출력**
    ```swift
    let stringArray : [[String]] = [["a","b","c"], ["d","e","f"]]
    for string in stringArray {
        print(string.joined())
    }
    // abc
    // def
    ```
    
* **두 시퀀스 반복 - zip 활용**
    ```swift
    let firstSequence = [1,2,3]
    let SecondSequence = [4,5,6]

    var result = 0

    for v in zip(firstSequence, SecondSequence) {
        let (first, second) = v
        result += first * second
    }
    print(result) // 32
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

### 고급 연산자
* **NOT Operator(~)**
    ```swift
    let value = ~0b00001111 // 11110000, -16
    ```

* **AND Operator(&)**
    ```swift
    let value = 0b00001100 & 00000111 // 00000100, 4
    ```
    
* **OR Operator(|)**
    ```swift
    let value = 0b00001100 | 00000111 // 00001111, 15
    ```
    
* **XOR Operator(^)**
    ```swift
    let value = 0b00001111 ^ 0b00001101 // 00000010, 2
    ```

<br>

### 진수
* **10진수 -> 3진수**
    ```swift
    var a = 45
    print(String(a, radix: 3)) // 1200
    ```

* **3진수 -> 10진수**
    ```swift
    var a = "1200"
    print(Int(a, radix: 3) ?? 0) // 45
    ```

<br>

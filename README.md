## 알고리즘 문제를 풀 때 자주 사용하는 문법
[1. 딕셔너리](#딕셔너리)  
[2. 문자열](#문자열)  
[3. 정렬](#정렬)  
[4. 형변환](#형변환)  
[5. 타입 생성](#타입-생성)  
[6. 출력](#출력)  
[7. 그래프 생성](#그래프-생성)

<br>

### 딕셔너리
* **기본**
    ```swift
    /* 선언 */
    let dict = [String: Int]()

    /* 할당 */
    let dict["A"] = 0

    /* 꺼내기 */
    let value = dict["A"] ?? 0 // key가 없어서 nil을 리턴받을 수 있음.
    ```

* **응용**
    ```swift
    /* 선언된 키에 번호 매기기 */
    let fruit = ["apple", "banana", "melon"]
    let dict = Dictionary(uniqueKeysWithValues: zip(fruit, 0..<3))

    /* 번호 키에 모든 값 0으로 할당 */
    let dict = Dictionary(uniqueKeysWithValues: zip(0..<26, Array(repeating: 0, count: 26)))
    ```

<br>

### 문자열
* **String -> String Array**
    ```swift
    let name = "Seungmin"
    let nameArray = Array(name).map { String($0) } // 음절을 String으로 형변환을 하지 않으면 Character 타입이 됨
    ```

* **String Array -> String**
    ```swift
    let nameArray = ["S","e","u","n","g","m","i","n"]
    let name = nameArray.joined()
    ```

* **String Array -> Two Dimensional String Array**
    ```swift
    let stringArray = ["010", "0001", "0101"]
    var array = [[Int]]()

    for string in stringArray {
        let line = string.map { String($0) }
        array.append(line)
    }
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

### 타입 생성
* **Typealias**
    ```swift
    /* typealias로 모델을 생성하면 객체를 생성할 때, 파라미터 이름을 쓰지 않아도 됨. */
    typealias Data = (Int, Int)
    let data = Data(0, 0)
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
    let data = DataType(0, 0)
    ```

<br>   

### 출력
* **문자열 합쳐서 출력**
    ```swift
    let stringArray : [[String]] = [["a","b","c"], ["d","e","f"]]
    for string in stringArray {
        print(string.joined())
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
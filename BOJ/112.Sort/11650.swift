// 좌표 정렬하기

let n = Int(readLine()!)!
var array = [[Int]]()

for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

array.sort(by: { ($0[0], $0[1]) < ($1[0], $1[1]) } )

for i in 0..<n {
    print(array[i][0], array[i][1])
}

// 행렬 곱셈
// 문제 유형: 수학
// 느낀점: 행렬 곱셈의 원리를 잊고 있었다..
// 풀이 방법: 첫 번째 배열의 열과 두 번째 배열의 행의 길이가 일치하여야 하고 
// 첫 번째 배열의 행 x 두 번째 배열의 열로 결과값이 생성된다는 것을 이용
// 첫 번째 배열의 각 행을 기준으로 두 번째 배열을 반복함
// 이 과정에서 첫 번째 배열의 아이템 길이만큼 두 번째 배열의 열과 곱셈연산 합산
// 합산한 값들을 하나의 행으로 쌓고 answer에 append 

let input1 = readLine()!.split(separator: " ").map { Int($0)! }

var (n,m) = (input1[0], input1[1])
var arr1 = [[Int]]()
var arr2 = [[Int]]()
var answer = [[Int]]()

for _ in 0..<n {
  let line = readLine()!.split(separator: " ").map { Int($0)! }
  arr1.append(line)
}

let input2 = readLine()!.split(separator: " ").map { Int($0)! }
var (k,l) = (input2[0], input2[1])

for _ in 0..<k {
  let line = readLine()!.split(separator: " ").map { Int($0)! }
  arr2.append(line)
}

for i in 0..<n { // 첫 번째 arr 행의 개수
  var sums = [Int]()
  for j in 0..<l { // 두 번째 arr 열의 개수
    var sum = 0
    for h in 0..<m { // 첫 번째 arr 열의 개수 or 두 번째 arr의 행의 개수
      sum += arr1[i][h] * arr2[h][j]
    }
    sums.append(sum)
  }
  answer.append(sums)
}

for arr in answer {
  for a in arr {
    print(a, terminator: " ")
  }
  print()
}

// 참외밭
// 문제 유형: 기하학
// 느낀점: 왜..이렇게 어렵지
// 풀이 방법: 큰 사각형 너비 - 작은 사각형 너비
// 작은 사각형을 구할 때, 시계 반대 방향으로 점을 찍기 때문에
// w, h의 가장 큰 값을 기준으로 w의 왼쪽, h의 오른쪽을 곱해서 구하려고 했으나, w,h이 h,w가 될 수 있다는 것을 간과
// (가장 높은 높이 값 기준 왼쪽 - 오른쪽 절대값) * (가장 높은 너비 값 기준 왼쪽 - 오른쪽 절대값)으로 작은 사각형의 넓이 구함
// 그래서 n * 큰 사각형 너비 - 작은 사각형의 너비

let n = Int(readLine()!)!
var arr = [Int]()
var (wIndex, hIndex, wMax, hMax) = (0,0,0,0)

for i in 0..<6 {
  let line = readLine()!.split(separator: " ").map { Int($0)! }
  let (d, v) = (line[0], line[1])
  if d == 1 || d == 2 {
    if wMax < v {
      wMax = v
      wIndex = i
    }
  } else {
    if hMax < v {
      hMax = v
      hIndex = i
    }
  }
  arr.append(v)
}

let subW = abs(arr[(6+hIndex-1) % 6] - arr[(6+hIndex+1) % 6])
let subH = abs(arr[(6+wIndex-1) % 6] - arr[(6+wIndex+1) % 6])

print(n * (arr[wIndex] * arr[hIndex] - subW * subH))
  
// 이전 풀이
// let n = Int(readLine()!)!
// var w = [Int]()
// var h = [Int]()
// var (i,j) = (0,0)

// for _ in 0..<6 {
//   let line = readLine()!.split(separator: " ").map { Int($0)! }
//   let (d, v) = (line[0], line[1])
//   if d == 1 || d == 2 {
//     w.append(v)
//   } else {
//     h.append(v)
//   }
// }

// if let wIndex = w.indexOfMax(),
//    let hIndex = h.indexOfMax() {
//   print(n * (w[wIndex] * h[hIndex] - w[(3+wIndex-1) % 3] * h[(3+hIndex+1) % 3]))
// } else {
//   print(-1)
// }

// extension Array where Element: Comparable {
//   func indexOfMax() -> Int? {
//     guard !self.isEmpty else { return nil }
    
//     var maxValue = self[0]
//     var maxValueIndex = 0
    
//     for (i, v) in self.enumerated() {
//       if maxValue < v {
//         maxValue = v
//         maxValueIndex = i
//       }
//     }
//     return maxValueIndex
//   }
// }


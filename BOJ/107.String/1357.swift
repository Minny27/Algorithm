// 뒤집힌 덧셈

let input = readLine()!.split(separator: " ").map { String($0.reversed()) }
print(Int(String(String(Int(input[0])! + Int(input[1])!).reversed()))!)
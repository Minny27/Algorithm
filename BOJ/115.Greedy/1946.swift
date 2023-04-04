// 백준 1946 - 신입 사원
// 문제 유형: 그리디
// 느낀점: 문제 접근 방법이 왜캐 안 떠오르지...

import Foundation

// 입력받는 클래스
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        return str
    }
}

let file = FileIO()

func solution() {
    for _ in 0..<file.readInt() {
        let n = file.readInt()
        var answer = 0
        var minValue = n + 1
        var array = [[Int]]()
        
        for _ in 0..<n {
            let item = [file.readInt(), file.readInt()]
            array.append(item)
        }
        // 서류 등수 기준 오름 차순 정렬
        array.sort { $0[0] < $1[0] }
        
        // 서류 등수 오름 차순 기준으로 면접 등수가 작으면 선발 가능(서류와 등수가 서로 반대로 높은 경우)
        // 면접 등수가 작은 값이 나올 때마다 갱신 후, count += 1
        for i in 0..<n {
            if minValue > array[i][1] {
                minValue = array[i][1]
                answer += 1
            }
        }
        print(answer)
    }
}

solution()


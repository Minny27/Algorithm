// 주차 요금 계산

import Foundation

typealias Fees = (
    defaultTime: Int, 
    defaultFee: Int, 
    perMinute: Int, 
    feePerMinute: Int
)

typealias CarData = (
    inTime: String, 
    outTime: String?,
    totalTime: Int,
    totalFee: Int
)

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    let fees = Fees(fees[0], fees[1], fees[2], fees[3])
    var carDict = [String: CarData]()
    
    for data in records {
        let splitData = data.split(separator: " ").map { String($0) }
        let time = splitData[0]
        let carNumber = splitData[1]
        let state = splitData[2]
        
        if state == "IN" {
            if let carData = carDict[carNumber] {
                carDict[carNumber] = CarData(time, nil, carData.totalTime, 0)
            } else {
                carDict[carNumber] = CarData(time, nil, 0, 0)
            }

        } else {
            if let carData = carDict[carNumber] {
                let totalMinute = stayTime(carData.inTime, time)
                carDict[carNumber] = CarData(
                    carData.inTime,
                    time,
                    carData.totalTime + totalMinute,
                    0
                )
            }
        }
    }
    
    carDict.forEach { carNumber, carData in
        if carData.outTime != nil {
            carDict[carNumber]!.totalFee = calculateFee(
                fees, 
                carData.totalTime
            )
        } else {
            let outTime = "23:59"
            let totalTime = stayTime(carData.inTime, outTime)
            carDict[carNumber]!.totalFee = calculateFee(
                fees, 
                carData.totalTime + totalTime
            )
        }
    }
    return calculateResult(carDict)
}

func stayTime(_ inTime: String, _ outTime: String) -> Int {
    let inTimeSplit = inTime.split(separator: ":").map { Int(String($0))! }
    let outTimeSplit = outTime.split(separator: ":").map { Int(String($0))! }
    let inMinute = inTimeSplit[0] * 60 + inTimeSplit[1]
    let outMinute = outTimeSplit[0] * 60 + outTimeSplit[1]
    let totalMinute = outMinute - inMinute
    return totalMinute
}

func calculateFee(_ fees: Fees, _ totalTime: Int) -> Int {
    if totalTime <= fees.defaultTime {
        return fees.defaultFee
    } else {
        let remainderMinute = totalTime - fees.defaultTime
        let quotient = remainderMinute / fees.perMinute
        let remainder = Double(remainderMinute % fees.perMinute) > 0 ? 1 : 0
        let totalFee = fees.defaultFee + (quotient + remainder) * fees.feePerMinute
        return totalFee
    }
}

func calculateResult(_ carDict: [String: CarData]) -> [Int] {
    let sortedCarDict = carDict.keys.sorted()
    var results = [Int]()
    
    sortedCarDict.forEach {
        results.append(carDict[$0]!.totalFee)
    }
    return results
}
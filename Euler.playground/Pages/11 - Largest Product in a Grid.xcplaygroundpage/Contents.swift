// Problem 11
// In the 20×20 grid below, four numbers along a diagonal line have been marked in red.
// The product of these numbers is 26 × 63 × 78 × 14 = 1788696.
// What is the greatest product of four adjacent numbers in the same direction (up, down, left, right, or diagonally) in the 20×20 grid?

import Foundation

func printTimeElapsedWhenRunningCode(_ operation:() -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    print("Time elapsed : \(timeElapsed) s")
}

func grid() {
    var sortedArray = [[String]](), largestProduct = 0, productArray = [1, 1, 1, 1]
    
    do {
        guard let fileUrl = Bundle.main.url(forResource: "grid", withExtension: "txt") else { fatalError() }
        let lineArray = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8).components(separatedBy: "\n")
        for i in 0...lineArray.count - 1 {
            let tempArray = lineArray[i].components(separatedBy: " ")
            sortedArray.append(tempArray)
        }
    } catch { print(error) }
    
    func biggestProduct(_ input: [Int]) {
        for x in 0...3 { if input[x] > largestProduct { largestProduct = input[x] } }
        productArray = [1, 1, 1, 1]
    }
    
    for y in 0...19 {
        for x in 0...16 {
            for i in 0...3 {
                productArray[0] *= Int(sortedArray[y][x+i])!  //horizontal product
                productArray[1] *= Int(sortedArray[x+i][y])! //vertical product
                if y < 17 {
                    productArray[2] *= Int(sortedArray[y+i][x+i])! //right diagonal product
                    productArray[3] *= Int(sortedArray[3-i+y][x+i])! //left diagonal product
                }
            }
            biggestProduct(productArray)
        }
    }
    print(largestProduct)
}

printTimeElapsedWhenRunningCode(grid)

/*
var sortedArray = [[String]](), largestProduct = 0, productArray = [1, 1, 1, 1], initialProduct = 1

do {
    guard let fileUrl = Bundle.main.url(forResource: "grid", withExtension: "txt") else { fatalError() }
    let lineArray = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8).components(separatedBy: "\n")
    for i in 0...lineArray.count - 1 {
        let tempArray = lineArray[i].components(separatedBy: " ")
        sortedArray.append(tempArray)
    }
} catch { print(error) }

func biggestProduct(input: [Int]) {
    for x in 0...3 { if input[x] > largestProduct { largestProduct = input[x] } }
    productArray = [1, 1, 1, 1]
}

for y in 0...19 {
    for i in 0...3 {
        productArray[0] *= Int(sortedArray[y][i])! //horizontal initial product
        productArray[1] *= Int(sortedArray[i][y])! //vertical initial product
    }
    for x in 4...19 {
        productArray[0] = productArray[0] * Int(sortedArray[y][x])! / Int(sortedArray[y][x-4])!
        biggestProduct(input: productArray)
    }
}

print(largestProduct)
*/

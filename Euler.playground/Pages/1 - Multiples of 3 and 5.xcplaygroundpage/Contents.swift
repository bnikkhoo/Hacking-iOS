// Problem 1
//If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23. Find the sum of all the multiples of 3 or 5 below 1000.

import Foundation

func multiples35() {
    var sum = 0

    for i in 3...999 {
        if i % 3 == 0 || i % 5 == 0 { sum += i }
    }
    print(sum)
}

func printTimeElapsedWhenRunningCode(_ operation:() -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    print("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(multiples35)

// Problem 10
// The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
// Find the sum of all the primes below two million.

import Foundation

func printTimeElapsedWhenRunningCode(_ operation:() -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    print("Time elapsed : \(timeElapsed) s")
}

func sieve(){
    
    let limit = 2000000
    var sum = 2
    var marks = [Bool](repeating: false, count: limit)
    
    for i in stride(from: 3, to: limit, by: 2) {
        if !marks[i] {
            sum += i
            for j in stride(from: i, to: limit, by: i*2) { marks[j] = true }
        }
    }
    print(sum)
}

printTimeElapsedWhenRunningCode(sieve)

// Problem 7
// By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13. What is the 10,001st prime number?

import Darwin

func isPrime(_ count: Int) -> Bool {
    if count == 1 {
        return false
    } else if count < 4 {
        return true
    } else if count % 2 == 0 {
        return false
    } else if count < 9 {
        return true
    } else if count % 3 == 0 {
        return false
    } else {
        let r = Int(floor(sqrt(Double(count))))
        var f = 5
        while f <= r {
            if count % f == 0 { return false }
            if count % (f + 2) == 0 { return false }
            f = f + 6
        }
    }
    return true
}

var limit = 10000, counter = 1, candidate = 1

while counter <= limit {
    candidate += 2
    if isPrime(candidate) == true { counter += 1 }
}

print(candidate)

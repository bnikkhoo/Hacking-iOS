//is it a prime number?

var theNumber = 41
var isPrime = true

for i in 2 ..< theNumber {
    
    if theNumber % i == 0 {
        
        isPrime = false
        
    }
    
}

if isPrime {
    
    print("\(theNumber) is prime!")
    
} else {
    
    print("\(theNumber) is not prime")
    
}

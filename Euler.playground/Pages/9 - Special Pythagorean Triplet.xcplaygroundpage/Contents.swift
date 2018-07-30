// Problem 9
// A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
// a^2 + b^2 = c^2
// For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
// There exists exactly one Pythagorean triplet for which a + b + c = 1000.
// Find the product abc.

import Foundation

func newFindProduct() {
    for a in 0...499 {
        let b = (1000 * a - 500000) / (a - 1000), c = Int(sqrt((Double(a*a+b*b))))
        if (b < c) && (a + b + c) == 1000 {
            print("a:", a, "\nb:", b, "\nc:", c, "\nProduct abc =", (a*b*c))
            break
        }
    }
}

func printTimeElapsedWhenRunningCode(_ operation:() -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    print("Time elapsed : \(timeElapsed) s")
}

printTimeElapsedWhenRunningCode(newFindProduct)

/*

 if a + b +c = 1000
 then
 
 a + b + sqrt(a² + b²) = 1000
 
 -> (a² + b²) = (1000 - a - b)²
 
 -> a² + b² = 1000000 - 2000a - 2000b + a² + 2ab + b²
 
 -> 0 = 500000 - 1000a - 1000b + ab
 
 -> 1000a - 500000 = b(a - 1000)
 
 -> b = (1000a - 500000) / (a - 1000)
 
 Then you try every a until you find one that makes a natural number out of b
 
b can't be higher than 499, because c>b and (b+c) would then be higher than 1000.
 
 first try:
 
 func findProduct() {
 for a in 0...499 {
 let b: Double = Double((1000 * a - 500000) / (a - 1000))
 let c = sqrt((Double(a*a))+(b*b))
 if Int(b) % 1 == 0 && (b < c) && (Double(a) + b + c) == 1000 {
 print("a:", a)
 print("b:", Int(b))
 print("c:", Int(c))
 print("Product abc =", (Int(Double(a)*b*c)))
 break
 }
 }
 }
 
 printTimeElapsedWhenRunningCode(operation: findProduct)
 */

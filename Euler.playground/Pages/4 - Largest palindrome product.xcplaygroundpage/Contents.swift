// Problem 4
//A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99. Find the largest palindrome made from the product of two 3-digit numbers.

var largest = 0

for num1 in stride(from: 999, to: 100, by: -1) {
    for num2 in stride(from: num1-1, to: 900, by: -1) {
        var product = num1 * num2
        if String(product) == String((String(product)).characters.reversed()) && product > largest { largest = product }
    }
}

print(largest)


// Answer using a reverse function - actually slower than the string function above!
/*
var a = 999
var b = 999
var largestP = 0

func reverse(number: Int) -> Int {
    var reversed = 0
    var number2 = number
    while number2 > 0 {
        reversed = 10 * reversed + number2 % 10
        number2 = number2 / 10
    }
    return reversed
}

while a >= 100 {
    
    while b >= 100 {
        
        let product = a * b
        
        let reversed = reverse(product)
        
        if product == reversed && product > largestP {
            
            largestP = product
            
            print(product)
            
        }
        
        b -= 1
        
    }
    
    if b == 99 {
        
        b = a - 1
        
    }
    
    a -= 1
}
 */

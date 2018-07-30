// Problem 3
// What is the largest prime factor of the number 600851475143?

var a = 600851475143, b = 2

while b < (a / 2) {
    if a % b == 0 {
        (a, b) = (a / b, b + 1)
    } else { b += 1 }
}

print(a)
// Problem 6
// The sum of the squares of the first ten natural numbers is, 1^2 + 2^2 + ... + 10^2 = 385. The square of the sum of the first ten natural numbers is, (1 + 2 + ... + 10)^2 = 552 = 3025. Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640. Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

var sum = 0, sumsq = 0

for x in 1...100 {
    sum += x
    sumsq+=(x*x)
}

print(sum*sum - sumsq)

let limit = 100
let total = limit*(limit+1)/2
let totalSqr = (2*limit+1)*(limit+1)*limit/6
print(total*total - totalSqr)

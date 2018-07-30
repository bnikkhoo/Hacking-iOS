/* The following iterative sequence is defined for the set of positive integers:
 
 n → n/2 (n is even)
 n → 3n + 1 (n is odd)
 
 Using the rule above and starting with 13, we generate the following sequence:
 
 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
 It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
 
 Which starting number, under one million, produces the longest chain?
 
 NOTE: Once the chain starts the terms are allowed to go above one million.  */

var numbers = [Int](), longestCount = 0, startingNumber = 0

for x in stride(from: 998000, to: 990000, by: -1) {
    numbers.append(x)
    while true {
        if numbers.last == 1 {
            if numbers.count > longestCount {
                (startingNumber, longestCount) = (numbers[0], numbers.count)
                print("Longest count is:", longestCount, "with starting number:", numbers[0])
            }
            break
        } else if numbers.last! % 2 == 0 {
            let temp = numbers.last! / 2
            numbers.append(temp)
        } else {
            let temp = numbers.last! * 3 + 1
            numbers.append(temp)
        }
    }
    numbers.removeAll()
}

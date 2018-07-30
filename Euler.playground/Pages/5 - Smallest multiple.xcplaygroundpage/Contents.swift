// Problem 5
// 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder. What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

var counter = 2520, check = true

while true {
    for i in 11...20 {
        if check {
            if counter % i != 0 {
                check = false
                break
            }
        }
    }
    
    if check {
        print(counter)
        break
    } else {
        counter += 2520
        check = true
    }
}
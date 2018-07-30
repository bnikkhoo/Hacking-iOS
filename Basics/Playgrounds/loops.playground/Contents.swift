//: Playground - noun: a place where people can play

import UIKit

var myFirstInt: Int = 0
for var i = 1; i <= 20; i *= 2 {
    myFirstInt += 1
    print("Hello \(myFirstInt)")
}

var mySecondInt: Int = 0
for p in 1...5 {
    mySecondInt += 1
    print("Bye \(mySecondInt)")
}

//non named interator. Cannont reference the iterator in the code
for _ in 1...3{
    print("test")
}

for case let x in 1...100 where x % 3 == 0 {
    print(x)
}

var w = 1
while w < 6 {
    print(w)
    w += 1
}

var x = 1
repeat {
    print(x)
    x += 1
} while x < 6

var shields = 0
var blastersOverheating = false
var blastersFireCount = 0
var spaceDemonsDestroyed = 0
while shields > 0 {
    if spaceDemonsDestroyed == 500 {
        print("You beat the game!")
        break
    }
    if blastersOverheating {
        print("Blasters are overheated! Cooldown initiated.")
        sleep(5)
        print("Blasters ready to fire")
        sleep(1)
        blastersOverheating = false
        blastersFireCount = 0
    }
    if blastersFireCount > 100 {
        blastersOverheating = true
        continue
    }
    print("Fire blasters!")
    blastersFireCount += 1
    spaceDemonsDestroyed += 1
}

var count = 0
for c in 1...5 {
    for d in 1...10 {
    count += 2
    print("Test \(count)")
    }
}
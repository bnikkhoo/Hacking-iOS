//: Playground - noun: a place where people can play

import UIKit

let playground = "Hello, playground"

var mutablePlayground = "Hello, mutable playground"

mutablePlayground += "!"

for c: Character in mutablePlayground.characters {
    print("\(c)")
}

let oneCoolDude = "\u{1F60E}"
let aACute = "\u{0061}\u{0301}"
for scalar in playground.unicodeScalars {
    print("\(scalar.value)")
}
let aAcutePrecomposed = "\u{00E1}"
let b = (aACute == aAcutePrecomposed) //precomposed = combined scalars
print("aAcute: \(aACute.characters.count); aAcuteDecomposed: \(aAcutePrecomposed.characters.count)")

let fromStart = playground.startIndex
let toPosition = 4
let end = fromStart.advancedBy(toPosition)
let fifthCharacter = playground[end]
let range = fromStart...end
let firstFive = playground[range]

let newHello = "\u{0048}\u{0065}\u{006C}\u{006C}\u{006F}"

//optionals
var errorCodestring: String?
errorCodestring = "404"
var errorDescription: String?
if let theError = errorCodestring, errorCodeInteger = Int(theError) where errorCodeInteger == 404 {
        errorDescription = ("\(errorCodeInteger + 200): the requested resource was not found")
}
var upCaseErrorDescription = errorDescription?.uppercaseString
errorDescription
upCaseErrorDescription?.appendContentsOf(" Please try again.")
upCaseErrorDescription = upCaseErrorDescription?.uppercaseString
print(upCaseErrorDescription)

let description = errorDescription ?? "No Error"
print(description)

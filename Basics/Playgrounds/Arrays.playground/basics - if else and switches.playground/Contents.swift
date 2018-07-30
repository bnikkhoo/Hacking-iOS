//: Playground - noun: a place where people can play

import UIKit

let population: Int = 990000
var message: String
var hasPostOffice: Bool = true

if population < 10000 {
    message = "\(population) is a tiny town"
} else if population >= 10000 && population < 50000 {
    message = "\(population) is a medium size town"
} else if population >= 50000 && population < 100000 {
    message = "\(population) is a big town!"
} else {
    message = "\(population) is a huge fucking town!!!!!"
}

print(message)

if !hasPostOffice { //notice the !, makes it the reverse...
    print("Then where do we buy the fucking stamps?!!")
} else {
    print("Let's buy some stamps here")
}

let y:Int8 = 120
let z = Int16(y) + 10000

var statusCode = 402
var errorString: String

switch statusCode {
case 400:
    errorString = "Bad Request"
case 401:
    errorString = "Unauthorized"
case 403:
    errorString = "Forbidden"
case 404:
    errorString = "Not Found"
default:
    errorString = "None"
}
print(errorString)

var statusCode2 = 400
var errorString2: String = "The request has failed with error:"

switch statusCode2 {
case 400, 401, 403, 404:
    errorString2 = "There was something wrong with the request."
fallthrough
default:
    errorString2 += " Please review the request and try again"
}
print(errorString2)

var statusCode3 = 400
var errorString3: String = "The request failed with error:"

switch statusCode3 {
case 100, 101:
    errorString3 += " Informational, \(statusCode3)."
case 204:
    errorString3 += " Successful but no content, \(statusCode3)."
case 300...307:
    errorString3 += " Redirection, \(statusCode3)."
case 400...417:
    errorString3 += " Client error, \(statusCode3)."
case 500...505:
    errorString3 += " Server error, \(statusCode3)."
case let unknownCode where (unknownCode >= 200 && unknownCode < 300) || unknownCode > 505:
    errorString3 = "Sorry, \(unknownCode) is not a known error code."
default:
    errorString3 = "Unexpected error encountered."
}
let error = (code: statusCode3, error: errorString3) //this is a touple with named elements
print(error.error)

let firstErrorCode = 403
let secondErrorCode = 40
let errorCodes = (firstErrorCode, secondErrorCode)
switch errorCodes {
case (404, 404):
    print("No items found.")
case (404, _):
    print("First item not found")
case (_, 404):
    print("Second item not found")
case(_, _):
    print("All items found")
fallthrough
default:
    print("Thank you")
}

let age = 25
if case 18...35 = age where age >= 21 {  //if case can use a where
    print("cool demographic and of drinking age")
}

let point = (x: 9, y: 0)
switch point {
case let q1 where (point.x > 0) && (point.y > 0):
    print("\(q1) is in quadrant 1")
case let q2 where (point.x < 0) && (point.y > 0):
    print("\(q2) is in quadrant 2")
case let q3 where (point.x < 0) && (point.y < 0):
    print("\(q3) is in quadrant 3")
case let q4 where (point.x > 0) && (point.y < 0):
    print("\(q4) is in quadrant 4")
case (0, 0):
    print("Point is right in the middle")
case (_, 0):
    print("\(point) sits on the x-axis")
case (0, _):
    print("\(point) sits on the y-axis")
default:
    print("Case not covered.")
}

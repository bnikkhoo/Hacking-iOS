//: Playground - noun: a place where people can play

import UIKit

var bucketlist = ["Fly a Cirrus jet to Cabo"]
var newItems = [
    "Have sex with 4 girls at once" ,
    "Watch all Bruce Lee movies in one day" ,
    "Climb El Capitan" ,
    "Go to all Tennis Grand Slams in the same year" ,
    "Get a hole in one"
]
bucketlist += newItems
bucketlist.remove(at: 1)
bucketlist[4] += (" on the golf course")
bucketlist[2] = "Climb an ant hill"
bucketlist.insert("Fly in a fighter jet", at: 1)
bucketlist
print(bucketlist.count)
print(bucketlist[0...3])
print(bucketlist)

var zizoList = [
    "Fly a Cirrus jet to Cabo" ,
    "Fly in a fighter jet" ,
    "Watch all Bruce Lee movies in one day" ,
    "Climb an ant hill" ,
    "Go to all Tennis Grand Slams in the same year" ,
    "Get a hole in one on the golf course"
]

let equality1 = (bucketlist == zizoList)

zizoList.insert("Hello Goozoo!", at: 6)
zizoList.append("hello goozoo")

let equality = (bucketlist == zizoList)
print(zizoList)

if zizoList.isEmpty == true{
    print("Empty")
} else{
    print("Not Empty")
}
print(zizoList.count)

var toDoList = ["Take out garbage", "Pay bills", "Cross off finished items"]
toDoList
print(toDoList)

var names:[String] = ["Apple", "Microsoft", "Sony", "Lenovo", "Asus"]
var reversedNames = [String]()
for var arrayIndex = names.count - 1 ; arrayIndex >= 0 ; arrayIndex -= 1 {
    reversedNames.append(names[arrayIndex])
}
print(reversedNames)

var movieRatings = ["Donnie Darko": 4, "Chunking Express": 5, "Dark City": 4] // a dictionary
print("I have rated \(movieRatings.count) movies")
let darkoRating = movieRatings["Donnie Darko"]
movieRatings["Dark City"] = 5
movieRatings

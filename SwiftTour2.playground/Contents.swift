//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some rainsins and make ants on a log.")
    
case "cucumber", "watercress":
    print("That would make a good tea sandwich")
    
case let x where x.hasSuffix("pepper") :
    print("is it a spicy \(x)");
    
default:
    print("Everything tastes good in soup.")
}

let interestingNumbers = ["Prime":[2,3,5,7,11,13],"Fibonacci":[1,1,2,3,5,8],
"Square":[1,4,9,16,25,36]]

var largest = 0
var largestKind = ""
for(kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largestKind = kind
        }
    }
}
print("largest~> \(largest) kind~> \(largestKind)")

var n = 2
while n < 100 {
    n *= 2
}
n

var m = 2
repeat {
    m *= 2
} while m < 100
m


var total = 0
for i in 0 ... 4 {
    // 0 ... 4 => 0 1 2 3 4
    // 0 ..< 4 => 0 1 2 3
    total += i
}
total







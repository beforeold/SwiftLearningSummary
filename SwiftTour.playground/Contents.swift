//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

print("Hello world!")

// var and constant

var myVariable = 42
myVariable = 50
let myConstant = 42
myConstant == myVariable

let implicitInteger = 70
let  implicitDouble = 70.0
let explicitDouble: Double = 70
// exercise
let explicitFloat: Float = 4

let label = "The width is"
let width = 94
let widthLabel = label + String(width)
// let widthLabel = label + width

let apples = 3
let oranges = 5
let appleSum = "I have \(apples) apples"
let fruitSum = "I have \(apples + oranges) fruits"
// exercise 
let float: Float = 3
let greetingToFloat = "Hello \(float)" + "Tom"


// Array and dictionary
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"
shoppingList

var occupations = ["Malcolm":"Captain", "Kaylee":"Machanic", ]
occupations["Jayne"] = "Public relations"
occupations

let emptyArray = [String]()
let emptyDict = [String: Float]()

shoppingList = []
occupations = [:]

// Control flow
let indivadualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in indivadualScores {
    if score > 50 {
        teamScore += 3
    }else{
        teamScore += 1
    }
}
print(teamScore)
// condition must be bool

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
print(optionalString == nil)
var greeting = "Hello!"
// if let 处理值缺失的情况 只能传入optional
// 先判断可选值是否为nil，不是nil则赋值
// 有点像一次安全判断
if let name = optionalName {
    greeting = "Hello,\(name)"
}else{
    greeting = "Hello no name"
}


let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"





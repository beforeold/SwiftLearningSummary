//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}

greet("Bob", day: "TuesDay")
greet("Alan", day: "Monday")

func lunchGreet(name: String, food: String, day: String) -> String {
    return "\(name) had \(food) for lunch \(day)."
}

lunchGreet("Luffy", food:"egg", day: "today")
lunchGreet("Ace", food:"egg", day: "today")

// 元组 返回多个值

func calculateStatistics(scores:[Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        }else if score < min {
            min = score
        }
        
        sum += score
    }
    
    return (min, max, sum)
}

let statistics = calculateStatistics([1, 2, 3])
print(statistics.sum)
print(statistics.2)

// 可变个数的参数
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    
    return sum
}

sumOf(1, 2, 3)

func averageOf(numbers: Int...) -> Int {
    var average: Int = 0
    var sum = 0
    for number in numbers {
        sum += number
    }
    average = sum / numbers.count;
    
    return average
}

averageOf(1, 2, 3)

// 函数的嵌套
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    
    add()
    return y
}

returnFifteen()

// 函数是第一等类型，这意味着函数可以作为另一个函数的返回值
func makeIncrementter() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1+number
    }
    
    return addOne
}

var increment = makeIncrementter()
increment(99)

// 函数也可以作为参数传入另外一个函数
func hasAnyMatches(list: [Int], condtion: Int -> Bool) -> Bool {
    for item in list {
        if condtion(item) {
            return true
        }
    }
    
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}


var numbers = [11, 20, 30]
hasAnyMatches(numbers, condtion: lessThanTen)


// 函数实际上是一种特殊的闭包
// 它是一段能之后被调取的代码
// 闭包中的代码能访问闭包所建作用域中能得到的变量和函数, 即使闭包是在一个不同的作用域被执行的
// 这个可以从嵌套函数的例子中看到
// 可以使用{}来创建一个匿名闭包
// 使用in将参数和犯规之类型声明与闭包函数体进行分离


let multi = numbers.map{(number: Int) -> Int in
    let result = 3 * number
    return result
}

let odd = numbers.map { (number: Int) -> Int in
    var result = number;
    if result%2 == 1 {
        result = 0
    }
    
    return result;
}

// 已知闭包的的类型，可以忽略参数的类型和返回值
// 同时单个语句的闭包会将语句的返回值作为结果返回
let mappedNumbers = numbers.map({number in 3*number})
print(mappedNumbers)

// 可以通过参数位置而不是参数名字来引用参数，这个方法在非常短的闭包中非常有用
// 当一个闭包作为最后一个参数传给一个函数的时候 它可以跟在括号后面
// 当一个闭包是传给函数的位移参数，你可以完全忽略括号

let sortedNumbers = numbers.sort{$0>$1}
print(sortedNumbers)





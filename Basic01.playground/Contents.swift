//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


let maxinumNumberOfLoginAttempt = 10
var currentLoginAttempt = 0

var x = 0.0, y = 0.0, z = 0.0


// 一般很少写类型标注，除非在声明时没有指定值，比如
var welcomeMessage: String
welcomeMessage = "Hello"

var red, greed, blue: Double

let π = 3.1415926
let 🐶 = "Dog"

let 你好 = "你好世界"
func 🐶🐶() -> String {
    return 你好
}

🐶🐶()

// 如果必须使用保留字作为变量名，使用反引号
var `break` = "breaked"
print(`break`)

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"

let languageName = "Swift"
// languageName = "OC" // this is wrong


// print函数有默认值，以\n结尾，如果不需要\n可以传入自己的值
print(friendlyWelcome)
print(friendlyWelcome, separator: "", terminator: "")

print("The current value of friendlyWelcome is \(friendlyWelcome)")

let 🐱🐱 = "🐱🐱"
print(🐱🐱)


// 整数
let minValue = UInt8.min
let maxValue = UInt8.max
let aminValue = Int8.min
let amaxValue = Int8.max

let nowMin = Int.min
let nowMax = Int.max

// Double 64
// Float 32


// about type safe 类型安全

// Type checks 类型检查

// type inference 类型推断
// literal value 字面值 会出发类型推断
let meaningOfLife = 42 // Int
let pi = 3.14159 // Double
let anotherPi = 3 + 0.14159 // Double


let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

// 十进制的幂运算
let decimalExp = 1.0e2 // 10的幂运算
let hexaDecimalExp = 0x1.0p2 // 2的幂运算

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexaDecimalDouble = 0xC.3p0 // 十六进制小数必须以指数结尾

// 使用下划线分隔数字不影响字面量
let paddedDouble = 000123.456
let oneMillione = 1_000_000
let justOverOneMillion = 1_000_000.000_000_000_1
let yiWan = 1_0000

// overflow 值溢出
//let cannotBeNegative: UInt8 = -1
//let tooBig: Int8 = Int8.max + 1

// cast
let twoThousand:UInt16 = 2_000
let one: UInt8 = 1
let towThousandAndOne = twoThousand + UInt16(one)

// cast 是调用构造器函数，构造器函数内部设计好了几种可以接收的参数类型
// 不能cast所有的类型，但是可以自定义不能cast的类型，使用extension


let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi2 = Double(three) + pointOneFourOneFiveNine

let intPi = Int(pi)
// 结合变量 与 结合字面量不一样
// 3 + 0.14159 可以直接相加
// 字面量只在编译器需要求值时进行推测

// 类型别名 type alias aliases
typealias AudioSample = UInt16

var maxAmplitudeFound = AudioSample.max

// Boolean Bool
true
false

let orangesAreOrange = true
let turnipsAreDelicous = false // turnip 甘蓝 大头菜

if turnipsAreDelicous {
    print("Mmm, tasty turnips!")
}else {
    print("Eww, turnips are horrible")
}

let i = 1
// wrong
//if i {
//    
//}

if i == 1 {
    // right
}

// 元组 tuple
// 元组将多个值组成一个混合值，元组内的值可以是任意类型，并不要求是同一类型
let http404Error = (404, "NotFound")
typealias HTTPResponseTuple = (code: Int, message: String) // typealias 结合tuple的使用
var aTuple: HTTPResponseTuple = (1, "sf")
aTuple.0 = 3
aTuple.1 = "well"
aTuple.code
aTuple.message

func returnMultValue() -> (number: Int, description: String) {
    return (1, "1 is good")
}


// tuple的分解使用
let (statusCode, statusMessage) = http404Error
statusCode
statusMessage

let (justTheStatusCode, _) = http404Error
justTheStatusCode

http404Error.0
http404Error.1

// 可以在定义时给元组内的单个元素命名
let http200Status = (sCode:200, description:"OK")

// 元组用于临时组织值时很有用，如果不是临时使用，可以使用类或者结构体

// optional用于处理值可能缺失的情况
// 最接近optional概念的是： 一个方法要不返回一个对象，要不返回nil，nil表示缺少一个合法的对象，但是只对对象起作用，对于结构体，基本的数据类型或者枚举不起作用，对于这些类型一般会返回一个特殊值，比如NSNotFound来暗示值缺失，而Swift的optional类型可以暗示任意类型的值缺失，不需要引入特殊值

let possibleNumber = "123" // "123a"
let convertedNumber = Int(possibleNumber) // 该构造器函数返回是的一个Int?的可选类型，而不是Int
// 可选则表示可能包含值，也可能什么都没有

var serverResponseCode: Int? = 404
serverResponseCode = nil // 必须为可选才能这样赋值

// 如果声明了一个可选变量但是没有赋值，那么自动被设置为nil
var surveyAnswer: String?
// OC 中nil 是指向不存在对象的指针, 而Swift中不是指针，而是表示 没有值

// 如果可选类型有值，它将不等于nil
// 不可选类型一定有值，因为没有值(没有初始化)的不可选类型是不可以使用的
let num: Int
var num2:Int
// num == 0 
// num2 == 0 // wrong 


// ==  !=
if convertedNumber != nil {
    print("Converted number has an integer value")
}else {
    print("This string can not be converted")
}

// 强制解析 force unwrapping 可选值
// 如果确定可选值有值以后可以在变量名后加上一个感叹号来获取值
if convertedNumber != nil {
    print(convertedNumber!)
}

// 直接强行取值，而实际却没有值时会出现运行时错误
// print(convertedNumber!) // danger 最好能像上面那句一样做安全判断


// 可选绑定 optional binding
// 先判断是否有值，再进行赋值
if let actualNumber = Int(possibleNumber) { // 如果要在if中操作actualNumber let->var
    print("ConvertedNumber \(actualNumber)")
}else {
    print("Unconverted")
}

// 如果多汗多个可选绑定在if语句中，并使用where子句做布尔值判断
if let firstNumber = Int("4"), secondNumber = Int("42") where firstNumber < secondNumber {
    print("\(firstNumber) < \(secondNumber)")
}else {
    print(false)
}

// 隐式解析可选类型 implicitly unwarapper optionals
// 用于可选值已经确认赋值了 从可选状态 变成隐式解析可选状态
// String? -> String!
// 隐式解析主要用在类的构造过程中
// 隐式解析可选类型，其实就是一个普通的可选类型，但是可以被当做非可选类型来使用，并不需要每次都使用解析来获取可选值

let possibleString: String? = "An optinal String."
let forcedString: String = possibleString! // 强制解析，需要感叹号

let assumedSString: String! = "An implictly unwrapped optional String."
let implicitString: String = assumedSString // 不需要感叹号 隐式解析
// 可以把隐式解析可选类型当做一个可以自动解析的可选类型，你要做的只是声明的时候把感叹号放到类型的结尾，而不是每次取值时的可选名字的结尾
// 隐式解析可选类型，说到底还是可选类型，如果在没有值时取值同样会出发运行时错误
let badImplictString: String! = nil
// print(badImplictString) // 对nil进行取值会出现运行时错误
if badImplictString != nil {
    print(badImplictString)
}else{
    print("Bad implict string")
}

if let definiteString = assumedSString {
    print(definiteString)
}
// 如果一个变量之后可能会变成nil的话，请不要使用隐式解析可选类型，如果你需要在变量的声明周期内都要做是否为nil的判断的话，那么使用普通可选类型


// 错误处理 error handling
func canThrowAnError() throws {
    
}

do {
    try canThrowAnError() // 需要使用try
}catch {
    // error thrown
}


// multi catch
enum Error : ErrorType {
    case OutOfDishes, MissingIngredients(String) // ingredients 配料
}


func makeASandwich() throws {
    
}

func eatASandwitch() {
    print("eat a sandwich")
}

func washDishes() {
    // 洗碟子
}

func buyGroceries(ingredients: String) { // grocery 杂货店
    
}

do {
    try makeASandwich()
    eatASandwitch()
}catch Error.OutOfDishes {
    
}catch Error.MissingIngredients(let x) {
    buyGroceries(x)
}

// 断言 assertion 如果缺少结果那么出发一个断言来找到值缺失的原因，中止应用,断言允许附加一条调试信息
let age = -3
// assert(age > 0, "Age must be bigger than 0")
// assert(age > 0)
// 当代码使用优化编译的时候，断言将会被禁用，例如在Xcode中使用默认的target release配置选项来build时，断言将被禁用
// 所以放心地使用断言

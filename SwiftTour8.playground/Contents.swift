//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

// 在尖括号内写一个名字来创建一个泛型函数或者类型

func repeatItem<Item>(item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    
    return result
}

repeatItem("Know", numberOfTimes: 2)

// reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

func anyCommonElements <T:SequenceType, U:SequenceType where T.Generator.Element:Equatable, T.Generator.Element == U.Generator.Element>(lhs: T, _ rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    
    return false
}

anyCommonElements([1, 2, 3], [1])

// exercise 修改上面的函数，使其返回共有的元素素组


//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


protocol ExampleProtocol {
    var simpleDecription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDecription: String = "A very simple class"
    var anotherProperty: Int = 69105
    
    func adjust() {
        simpleDecription += "Now 100% adjusted"
    }
}

var a = SimpleClass()
a.simpleDecription
a.adjust()
a.simpleDecription

struct SimpleStruct : ExampleProtocol {
    var simpleDecription: String = "A simple struct"
    mutating func adjust() { // 修改结构体数据需要mutating修饰方可，而类则不需要
        simpleDecription += " adjusted"
    }
}

var b = SimpleStruct()
b.adjust()
b.simpleDecription

enum SimpleEnum : Int, ExampleProtocol {
    case A, B
    
    var simpleDecription: String {
        switch self {
        case .A:
            return "A"
        default:
            return "B"
        }
    }
    
    func adjust() {
        print("adjsuted")
    }
}

var c = SimpleEnum.A
c.adjust()
c.simpleDecription


// extension
extension Int : ExampleProtocol {
    var simpleDecription: String {
        return "Number \(self)"
    }
    
    mutating func adjust() {
        self += 2
    }
    
}

7.simpleDecription
var value = 8
value.adjust() // 8.adjust()不可用，因为8是常量 immutable
value


// exercise
extension Double {
    var absoluteValue: Double {
        return self > 0 ? self : -self
    }
}


var absolute = (-2.0).absoluteValue


let protocolValue: ExampleProtocol = a
protocolValue.simpleDecription





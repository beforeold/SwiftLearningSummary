//
//  TestTypeErased.swift
//  TestSwift5_7
//
//  Created by beforeold on 2022/9/25.
//

import Foundation

protocol Printer<T> {
    associatedtype T
    func print(val: T)
}

struct Logger: Printer {
    func print(val: String) {
        Swift.print(val)
    }
}

struct Message: Printer {
    func print(val: String) {
        Swift.print(val)
    }
}


struct TestTypeErased {
    static func test() {
        if #available(macOS 13.0.0, *) {
            let array: [any Printer<String>] = [Logger(), Message()]
            array.forEach { pri in
                pri.print(val: "v")
            }
            print(array)
        } else {
            // Fallback on earlier versions
        }
        
        var anyArray: [any Printer] = [Logger()]
        anyArray.append(Message())
        anyArray.append(Logger())
        anyArray.forEach { pri in
            // pri.print(val: <#T##Printer.T#>)
            print(pri)
        }
        
        var someArray: [some Printer] = [Logger()]
        // someArray.append(Message())
        // someArray.append(Logger())
        someArray.forEach { pri in
            // pri.print(val: <#T##Printer.T#>)
            print(pri)
        }
    }
    
    static func createPrinter() -> some Printer<String> {
        return Logger()
    }
    
    static func createPrinter2() -> some Printer {
        return Logger()
    }
    
    static func createPrinter3() -> any Printer {
        return Logger()
    }
}

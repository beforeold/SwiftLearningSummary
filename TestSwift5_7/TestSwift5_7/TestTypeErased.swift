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
        
    }
    
    static func createPrinter() -> some Printer<String> {
        return Logger()
    }
}

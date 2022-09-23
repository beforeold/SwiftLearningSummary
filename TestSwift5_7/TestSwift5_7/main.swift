//
//  main.swift
//  TestSwift5_7
//
//  Created by beforeold on 2022/9/21.
//

import Foundation

protocol Shape: Equatable {
    
}

struct Diagram: Shape {
    static func == (lhs: Diagram, rhs: Diagram) -> Bool {
        for s1 in lhs.children {
            print(s1 is any Identifiable)
        }
        return true
    }
    
    var children: [any Shape] = []
}

protocol Cache<Content> {
    associatedtype Content

    var items: [Content] { get set }

    init(items: [Content])
    mutating func add(item: Content)
}


struct FileCache: Cache {
    var items: [String]

    mutating func add(item: String) {
        items.append(item)
    }
    
    typealias Content = String
}

struct MemoCache: Cache {
    var items: [String]

    mutating func add(item: String) {
        items.append(item)
    }
    
    typealias Content = String
}


func foo() -> some Cache<String> {
    return FileCache(items: [])
}


var cache = foo()
cache.add(item: "")
print(cache)



var val: any Cache<String> = FileCache(items: [])
val = MemoCache(items: [])


struct ClosureUpdate {
    static func foo() {
        let v0 = 2
        let compare = {
            let v1 = 10
            let v2 = v1 + v0
            if v1 > v2 {
                return true
            }
            return false
        }
        print(compare())
    }
}


print("Hello, World!")

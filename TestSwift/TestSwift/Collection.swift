//
//  Collection.swift
//  TestSwift
//
//  Created by beforeold on 2022/9/19.
//

import Foundation


class TestCollection {
  static func slice() {
    let array = [1, 2, 3]
    let slice = array[1...2]
    for item in slice {
      print("slice", item, ":")
    }
  }
  
  static func test() {
    slice()
    
    // will not crash when enumeating
    do {
      var nums = [1, 2, 3]
      for _ in nums {
        print("removed", nums.removeLast(), separator: ":")
      }
      print("result", nums, separator: ":")
    }
    
    class Stack<Element>: Sequence, IteratorProtocol {
      var array: [Element]
      
      init(array: [Element]) {
        self.array = array
      }
      
      func makeIterator() -> StackIterator<Element> {
        StackIterator(self)
      }
      
      func next() -> Element? {
        if self.array.count == 0 {
          return nil
        }
        return self.array.removeFirst()
      }
    }
    
    
    struct StackIterator<Element>: IteratorProtocol {
      mutating func next() -> Element? {
        // return stack.array.randomElement()
        
        if stack.array.isEmpty {
          return nil
        }
        return stack.array.removeFirst()
      }
      
      let stack: Stack<Element>
      init(_ stack: Stack<Element>) {
        self.stack = stack
      }
    }
    
    do {
      let stack = Stack(array: [1, 2, 3, 4, 5, 6])
      
      // var iterator = make iterator
      // next
      
      for item in stack {
        print("first for-in", item)
        if item == 3 {
          break
        }
      }
      
      for item in stack {
        print("second for-in", item)
      }
    }
  }
}

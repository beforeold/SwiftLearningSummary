//
//  TestClassArray.swift
//  TestSwift
//
//  Created by beforeold on 2022/9/25.
//

import Foundation

struct TestClassArray {
  
  class Animal {
      
  }

  class Dog: Animal {
      
  }
  
  class Cat: Animal {
    
  }

  private static func foo(_ array: [Animal]) -> (some Animal)? {
    return array.first
  }
  
  static func test() {
    let dogs: [Animal] = [Dog(), Cat()]
    print(foo(dogs) as Any)
    
    let animals: [Dog] = [Dog]()
    print(foo(animals) as Any)
  }
}

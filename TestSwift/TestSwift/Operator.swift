//
//  Operator.swift
//  TestSwift
//
//  Created by beforeold on 2022/9/21.
//

import Foundation

// 自定义大于号，支持可选值的判断
func > <T: Comparable>(lhs: T?, rhs: T) -> Bool {
  guard let lhs = lhs else {
    return false
  }
  return lhs > rhs
}

struct Operator {
  struct Person {
    var array: [Int] = []
  }
  
  static func test() {
    let p1: Person? = nil
    assert((p1?.array.count > 0) == false)
    
    let p2: Person = .init(array: [1])
    assert(p2.array.count > 0)
  }
}

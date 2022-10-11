//
//  POP.swift
//  TestSwift
//
//  Created by beforeold on 2022/9/18.
//

import Foundation


protocol Ordered {
  func lessThan(_ val: Self) -> Bool
}

// 对 Ordered 进行扩展，而不是 Comparable 的原因是不滥用，只选择性 selective
// 也就是只在声明为 Ordered 的 Comparable 的类型，才有这个 lessThan 能力
// 即，不是让所有的 Comparable 额外都拥有了 lessThan
extension Ordered where Self: Comparable {
  func lessThan(_ val: Self) -> Bool {
    return self < val
  }
}

extension Comparable where Self: Ordered {
  static func < (lhs: Self, rhs: Self) -> Bool {
    return lhs.lessThan(rhs)
  }
}

fileprivate
func foo<T: Ordered>(_ val: T) {
  print(val)
}

extension Int: Ordered {}

fileprivate
func testFoo() {
  foo(5)
}

extension Comparable {
  func lessThan(_ val: Self) -> Bool {
    return self < val
  }
}

fileprivate
func testDouble() {
  // 如果直接 extension Comparable
  // Double 支持支持了 lessThan(_:)
  _ = 0.5.lessThan(0.4)
}

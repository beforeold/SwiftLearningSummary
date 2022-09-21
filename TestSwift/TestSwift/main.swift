//
//  main.swift
//  TestSwift
//
//  Created by beforeold on 2022/9/16.
//

import Foundation

do {
  let nums = [1, 2, 3, 6, 8, -1, -2, -3]
  var sum = 0
  for num in nums where num > 0 && num < 5 {
    sum += num
  }
  assert(sum == 6)
}

do {
outer:
  for i in 1...4 {
    for k in 1...4 {
      if k == 3 {
        continue outer
      }
      if i == 3 {
        break outer
      }
      print("i = \(i), k = \(k)")
    }
  }
}

print("hello world")

do {
  enum TestEnum {
    case test1, test2, test3
  }
  
  func showMemo<T>(type: T.Type) {
    print(type, "stride", MemoryLayout<T>.stride, separator: " ")
    print(type, "size", MemoryLayout<T>.size, separator: " ")
    print(type, "alignment", MemoryLayout<T>.alignment, separator: " ")
  }
  
  // 1
  enum TestEnum2: Int {
    case c1, c2, c3
  }
  
  // 1
  enum TestEnum3: Int {
    case c1
  }
  
  // 4
  enum TestEnum4 {
    case c1(Int)
  }
  
  // 32
  // 3 * 8 + 8 (表示 case）
  enum TestEnum5 {
    case c1(Int, Int, Int)
    case c2(Int, Int)
    case c3(Int)
    case c4(Bool)
    case c5
  }
  
  showMemo(type: TestEnum.self)
  showMemo(type: TestEnum2.self)
  showMemo(type: TestEnum3.self)
  showMemo(type: TestEnum4.self)
  showMemo(type: TestEnum5.self)
  showMemo(type: Character.self)
}

do {
  // 遍历数组，将遇到的正数都加起来，如果遇到负数或者非数字，停止遍历
  let strings = ["10", "20", "abc", "-10", "30"]
  var index = 0
  var sum = 0
  while index < strings.count,
        let num = Int(strings[index]),
        num > 0 {
    sum += num
    index += 1
  }
  print(sum)
}

do {
  let v1 = 2
  let v2: Int? = 2
  
  let a: Int? = 0
  let r1 = a ?? v1
  let r2 = a ?? v2
  print(r1)
  print(String(describing: r2))
}

do {
  typealias Func = (Int) -> (Int, Int)
  func getClosure() -> (plus: Func, sub: Func) {
    var num1 = 0
    var num2 = 0
    func plus(_ i: Int) -> (Int, Int) {
      num1 += i
      num2 += (i << 1)
      return (num1, num2)
    }
    
    func sub(_ i: Int) -> (Int, Int) {
      num1 -= i
      num2 -= (i << 1)
      return (num1, num2)
    }
    
    return (plus, sub)
  }
  
  class Closure {
    var num1 = 0
    var num2 = 0
    func plus(_ i: Int) -> (Int, Int) {
      num1 += i
      num2 += (i << 1)
      return (num1, num2)
    }
    
    func sub(_ i: Int) -> (Int, Int) {
      num1 -= i
      num2 -= (i << 1)
      return (num1, num2)
    }
  }
  
  let (p1, s1) = getClosure()
  print(p1(5))
  print(s1(4))
  print(p1(3))
  print(p1(5))
  
  let closure = Closure()
  let p2 = closure.plus
  let s2 = closure.sub
  print(p2(5))
  print(s2(4))
  print(p2(3))
  print(s2(5))
}

extension CustomStringConvertible {
  func printed() {
    print(self)
  }
}

struct XX: OptionSet {
  let rawValue: Int
}


TestCollection.test()

Operator.test()

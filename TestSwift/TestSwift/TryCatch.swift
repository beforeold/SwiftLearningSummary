//
//  TryCatch.swift
//  TestSwift
//
//  Created by beforeold on 2022/9/23.
//

import Foundation

struct TryCatch {
  fileprivate static func biggerThanFive(arg: Int) throws -> Int {
    if arg > 5 {
      return arg
    }
    
    throw NSError()
  }
  
  static func test() {
    try1()
  }
  
  // normal try catch
  static func try1() {
    let ret: Int?
    if let val = try? biggerThanFive(arg: 10) {
      if val > 5 {
        ret = 5
      } else {
        ret = -1
      }
    } else {
      ret = nil
    }
    
    print(ret as Any)
  }
  
  // try catch using a wrapped closure
  static func try2() {
    let ret = try? { () -> Int in
      let ret = try biggerThanFive(arg: 10)
      if ret > 5 {
        return ret
      }
      return -1
    }()
    
    print(ret as Any)
  }
  
  static func try3() {
    let temp = try? biggerThanFive(arg: 10)
    let ret = temp.map {
      $0 > 5 ? $0 : 1
    }
    
    print(ret as Any)
  }
}

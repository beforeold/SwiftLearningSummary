//
//  TestOptionalArray.swift
//  TestSwift
//
//  Created by beforeold on 2022/10/12.
//

import Foundation


struct TestOptionalArray {
  static func test() {
    
    do {
      var array: [Int]?
      array?.append(5)
      assert(array == nil)
    }
    
    do {
      var array: [Int]? = [1]
      let ret: ()? = array?.append(5)
      assert(ret != nil)
      assert(array == [1, 5])
    }
    
    do {
      var array: [Int]?
      if array?.append(5) == nil {
        array = [5]
      }
      assert(array == [5])
    }
  }
}

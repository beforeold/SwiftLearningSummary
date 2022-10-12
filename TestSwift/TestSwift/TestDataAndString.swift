//
//  TestDataAndString.swift
//  TestSwift
//
//  Created by beforeold on 2022/10/12.
//

import Foundation

struct TestDataAndString {
  public static func foo() {
    do {
      // string to data
      let string = "jsonString"
      
      let data_ = string.data(using: .utf8)
      
      let data = Data(string.utf8)
      
      assert(data_ == data)
    }
    
    do {
      // data -> string
      let data = Data()
      
      let string_ = String(data: data, encoding: .utf8)
      let string = String(decoding: data, as: UTF8.self)
      
      assert(string_ == string)
    }
  }
  
}

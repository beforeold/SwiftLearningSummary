//
//  TestArray.swift
//  TestSwift
//
//  Created by beforeold on 2022/9/23.
//

import Foundation

struct TestArray {
  static func test() {
    testClass()
    testStruct()
  }
  
  static func testStruct() {
    struct Address {
      var street = ""
      var city = ""
      var state = ""
      enum AddressAttributes {
        case Street
        case City
        case State
      }
    }
    
    testPerformanceForClassArray()
    testPerformanceForClassContiguousArray()
    
    func testPerformanceForClassArray() {
      let address = Address()
      measure {
        var array: [Address]  = []
        for _ in 0..<10_000_000 {
          array.append(address)
        }
      }
    }
    
    func testPerformanceForClassContiguousArray() {
      let address = Address()
      measure {
        var array: ContiguousArray<Address> = []
        for _ in 0..<10_000_000 {
          array.append(address)
        }
      }
    }
  }
  
  static func testClass() {
    class Address {
      var street = ""
      var city = ""
      var state = ""
      enum AddressAttributes {
        case Street
        case City
        case State
      }
    }
    
    testPerformanceForClassArray()
    testPerformanceForClassContiguousArray()
    
    func testPerformanceForClassArray() {
      let address = Address()
      measure {
        var array: [Address]  = []
        for _ in 0..<10_000_000 {
          array.append(address)
        }
      }
    }
    
    func testPerformanceForClassContiguousArray() {
      let address = Address()
      measure {
        var array: ContiguousArray<Address> = []
        for _ in 0..<10_000_000 {
          array.append(address)
        }
      }
    }
  }
  
  static func measure(closure: () -> Void) {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    print(CFAbsoluteTimeGetCurrent() - start)
  }
}

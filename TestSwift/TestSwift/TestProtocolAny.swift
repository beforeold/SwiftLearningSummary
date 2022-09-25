//
//  TestProtocolAny.swift
//  TestSwift
//
//  Created by beforeold on 2022/9/25.
//

import Foundation


protocol Runable {
  func run()
}

extension Runable {
  func foo() {
    let array: [any Runable] = []
    print(array)
  }
}

struct TestProtocolAny {
  class TableView {
    var delegate: (any Runable)? 
  }
}

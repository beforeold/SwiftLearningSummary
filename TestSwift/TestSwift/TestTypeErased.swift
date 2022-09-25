//
//  TestTypeErased.swift
//  TestSwift
//
//  Created by beforeold on 2022/9/25.
//

import Foundation

protocol Printer {
  associatedtype T
  func print(val: T)
}

//struct AnyPrinter<U>: Printer {
//    typealias T = U
//
//    var base: Printer<T>
//    // Error: Protocol 'Printer' can only be used as a generic constraint because it has Self or associated type requirements
//
//    var base: Printer
//    // Error: Cannot specialize non-generic type 'Printer'
//
//    init<Base: Printer>(base : Base) where Base.T == U {
//        self.base = base
//    }
//
//    func print(val: T) {
//        base.print(val)
//    }
//}

struct AnyPrinterFunc<T>: Printer {
  private let _print: (T) -> ()
  
  init<Base: Printer>(_ base : Base) where Base.T == T {
    _print = base.print
  }
  
  func print(val: T) {
    _print(val)
  }
}


class _PrinterBoxBase<T>: Printer {
  func print(val: T) {
    fatalError()
  }
}

class _PrinterBox<Base: Printer>: _PrinterBoxBase<Base.T> {
  var base: Base
  
  init(_ base: Base) {
    self.base = base
  }
  
  override func print(val: T) {
    base.print(val: val)
  }
}

struct AnyPrinter<T>: Printer {
  var _box: _PrinterBoxBase<T>
  
  init<Base: Printer>(_ base: Base) where Base.T == T {
    _box = _PrinterBox(base)
  }
  
  func print(val: T) {
    _box.print(val: val)
  }
}

/*
 class AnyPrinterDirect<T>: Printer {
 let base: Base
 
 init<Base: Printer>(_ base: Base) where Base.T == T {
 self.base = base
 }
 
 func print(val: T) {
 base.print(val: val)
 }
 }
 */

struct Logger: Printer {
  func print(val: String) {
    
  }
}

struct Message: Printer {
  func print(val: String) {
    Swift.print("m")
  }
}

struct TestTypeErased {
  static func test() {
    
    let array: [AnyPrinterFunc<String>] = [
      AnyPrinterFunc(Logger()),
      AnyPrinterFunc(Message()),
    ]
    
    let boxArray: [_PrinterBoxBase<String>] = [
      _PrinterBox(Logger()),
      _PrinterBox(Message()),
    ]
    
    let betterArray: [AnyPrinter<String>] = [
      AnyPrinter(Logger()),
      AnyPrinter(Message()),
    ]
    
    print(array, boxArray, betterArray)
  }
}

//
//  StringDecoding.swift
//  TestSwift
//
//  Created by beforeold on 2022/9/25.
//

import Foundation
import Combine

protocol StringDecoding {
  associatedtype T
  func decode(_ text: String) throws -> T
}

extension StringDecoding where Self: TopLevelDecoder, Self.Input == Data {
  func decode<T: Decodable>(_ text: String) throws -> T {
    let data = text.data(using: .utf8)!
    let ret = try self.decode(T.self, from: data)
    return ret
  }
}

struct MyJSONDecoder<T: Decodable>: TopLevelDecoder {
  func decode<T>(_ type: T.Type, from: Data) throws -> T where T : Decodable {
    return try JSONDecoder().decode(type, from: from)
  }
}

extension MyJSONDecoder: StringDecoding {
}

struct JSONStringDecoder<T: Decodable>: StringDecoding {
  func decode(_ text: String) throws -> T {
    let data = text.data(using: .utf8)!
    let ret = try JSONDecoder().decode(T.self, from: data)
    return ret
  }
}

//struct TextDecoder: TopLevelDecoder {
//  func decode<T>(_ type: T.Type, from: String) throws -> T where T : Decodable {
//    return self
//  }
//}

struct DataStringDecoder<D: TopLevelDecoder, T: Decodable>: StringDecoding where D.Input == Data {
  let baseDecoder: D
  init(baseDecoder: D) {
    self.baseDecoder = baseDecoder
  }
  
  func decode(_ text: String) throws -> T {
    let data = text.data(using: .utf8)!
    let ret = try baseDecoder.decode(T.self, from: data)
    return ret
  }
}

private func foo() {
  let dataDecoder = DataStringDecoder<_, String>(baseDecoder: JSONDecoder())
  _ = try? dataDecoder.decode("")
}

private var map: [String: String] = {
  var map = [String: String]()
  map["key"] = "hello"
  map["object"] = "{\"key\":\"value\"}"
  map["freeJSON"] = "{\"key\":\"value\"}"
  return map
}()

private func defaultDecode<Value: Decodable>(_ data: Data) throws -> Value {
  // JSONDecoder does not support top level string
  if Value.self == String.self {
    return String(data: data, encoding: .utf8) as! Value
  }
  
  return try JSONDecoder().decode(Value.self, from: data)
}

private func defaultDecode2<Value: Decodable>(_ data: Data) throws -> Value {
  // JSONDecoder does not support top level string
  if Value.self == String.self {
    return String(data: data, encoding: .utf8) as! Value
  }
  
  return try JSONDecoder().decode(Value.self, from: data)
}

@propertyWrapper
struct Config<Value: Decodable> {
  let defaultValue: Value
  let group: String
  let key: String
  let decoderClosure: (Data) throws -> Value
  
  public init(wrappedValue: Value,
              group: String = "",
              key: String,
              decoderClosure: @escaping (Data) throws -> Value = defaultDecode) {
    self.group = group
    self.defaultValue = wrappedValue
    self.key = key
    self.decoderClosure = decoderClosure
  }
  
  var wrappedValue: Value {
    guard let mapValue = map[key] else {
      return defaultValue
    }
    
    guard let data = mapValue.data(using: .utf8) else {
      return defaultValue
    }
    
    guard let ret = try? decoderClosure(data) else {
      return defaultValue
    }
    
    return ret
  }
}

func bar() {
  do {
    @Config(key: "key")
    var abc: String = "default"
    print(abc)
  }
  
  do {
    func makeString() -> String {
      ""
    }
    
    @Config(group: makeString(), key: "key", decoderClosure: defaultDecode2)
    var abc: String = "default"
    print(abc)
  }
  
  struct Object: Decodable {
    var key: String
  }
  
  do {
    @Config(key: "object")
    var abc: Object = .init(key: "default")
    print(abc)
  }
  
  struct Dictionary: Decodable {
    var key: String
  }
  
  enum FreeJSON: Decodable {
    typealias Wrapped = Dictionary
    case value(Dictionary)
    case none
    
    init(from decoder: Decoder) throws {
      let container = try decoder.singleValueContainer()
      if let value = try? container.decode(Wrapped.self) {
        self = .value(value)
      } else {
        self = .none
      }
    }
  }
  
  
  do {
    @Config(key: "freeJSON")
    var abc: FreeJSON = .none
    print(abc)
  }
}

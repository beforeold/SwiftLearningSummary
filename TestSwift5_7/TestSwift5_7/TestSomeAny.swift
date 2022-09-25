//
//  TestSomeAny.swift
//  TestSwift5_7
//
//  Created by beforeold on 2022/9/25.
//

import Foundation

protocol SomeProtocol {
    
}

private class MusicPlayer<T: Collection> where T.Element == String {
    var playlist: T!
    
    func play(_ playlist: T) {
        self.playlist = playlist
    }
}

class TestSomeAny {
    var array = [any SomeProtocol]()
    
    private func foo(_ value: some SomeProtocol) {
        
    }
    
    private func foo(_ value: any SomeProtocol) {
        
    }
    
    static func createSomeEquatable() -> some Equatable {
        return 1
    }
    
    static func createSomeCollection() -> some Collection {
        return [1]
    }
    
    static func createSomeComparable() -> some Comparable {
        return 1
    }
    
    static func createSomeComparable2() -> some Comparable {
        return 1
    }
    
    static func test() {
        let e1 = createSomeEquatable()
        let e2 = createSomeEquatable()
        print(e1 == e2)
        // print(e1 + e2)
        
        var c1 = createSomeCollection()
        let c2 = createSomeCollection()
        c1 = c2
        print(c1, c2)
        // c1 += c2
        
        let cmp1 = createSomeComparable()
        let cmp2 = createSomeComparable2()
        // print(cmp1 > cmp2)
        print(cmp1, cmp2)
    }
}


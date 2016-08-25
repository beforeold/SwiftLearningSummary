//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescrition() -> String {
        switch self {
        case .Ace:
            return "ace"
            
        case .Jack:
            return "jack"
            
        case .Queen:
            return "queen"
            
        case .King:
            return "king"
            
        default:
            return String(self.rawValue)
        }
    }
}

func isRank1LargerThanRank2(rank1: Rank, rank2: Rank) -> Bool {
    return rank1.rawValue > rank2.rawValue
}




let ace = Rank.Ten
let aceRawValue = ace.rawValue
let aceDesc = ace.simpleDescrition()

let rank1 = Rank.King
let rank2 = Rank.Ace
isRank1LargerThanRank2(rank1, rank2: rank2)

if let convertedRank = Rank(rawValue: 14) {
    let threeDesc = convertedRank.simpleDescrition()
}else {
    false
}

// 如果枚举的没有比较有意义的原始值，就不需要提供原始值
enum Suit {
    case Spades, Hearts, Clubs, Diamonds
    
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
            
        case .Hearts:
            return "hearts"
            
        case .Clubs:
            return "clubs"
            
        case .Diamonds:
            return "diamonds"
        }
    }
    
    func color() -> String {
        switch self {
        case .Spades:
            return "Black"
            
        case .Hearts:
            return "Red"
            
        case .Clubs:
            return "Black"
            
        case .Diamonds:
            return "Red"
        }
    }
}

let hearts = Suit.Hearts
hearts.simpleDescription()
hearts.color()

// 已知变量类型的情况下可以使用缩写 .Diamond

// 结构体和类有很多相同的地方，最大的区别是 结构体是传值，而类是传引用

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescrition()) of \(suit.simpleDescription())"
    }
    
    func createDeck() -> [Card] {
        let ranks = [Rank.Ace, Rank.Two, Rank.Three, Rank.Four, Rank.Five, Rank.Six,Rank.Seven, Rank.Eight, Rank.Nine, Rank.Ten, Rank.Jack, Rank.Queen, Rank.King]
        // 之类可以使用 1...13
        // 1...13 是1-2- ... -12-13
        // 1..<13 是1-2- ... -12 没有13
        //http://stackoverflow.com/questions/24109691/add-a-method-to-card-that-creates-a-full-deck-of-cards-with-one-card-of-each-co
        
        let suits = [Suit.Spades, Suit.Hearts, Suit.Clubs, Suit.Diamonds]
        
        var deck = [Card]()
        for suit in suits {
            for rank in ranks {
                let card = Card(rank: rank, suit: suit)
                deck.append(card)
            }
        }
        
        return deck
    }

}

// 这里已知变量类型，可以省略枚举类型直接使用.Three
let threedOfSpades = Card(rank: .Three, suit: .Spades)
threedOfSpades.simpleDescription()
let deck = threedOfSpades.createDeck()
deck.count

enum ServerResponse {
    case Result(String, String)
    case Failure(String)
    case BadNetwork(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Failure("Out of cheese")
let bad = ServerResponse.BadNetwork("2G")

switch bad {
case let .Result(sunrise, sunset):
    let serverResonse = "Sunrise is \(sunrise), sunset is\(sunset)"
    
case let .Failure(message):
    print("Failure \(message)")
    
case let .BadNetwork(reason):
    print("Bad reason \(reason)")
}


//: Define the ⨉ (sequence product) operator.

infix operator ⨉ {}


func ⨉<A:SequenceType, B:SequenceType>(lhs: A, rhs: B)
    -> [(A.Generator.Element, B.Generator.Element)] {
        
        return lhs.flatMap{ left in rhs.map{ right in (left, right) }}
}

[1, 2] ⨉ [3, 4, 6]


//: Test with the cards example.

import Foundation

enum Suit: String {
    case Spades = "♠"
    case Hearts = "♥"
    case Diamonds = "♦"
    case Clubs = "♣"
}

typealias Rank = String
typealias Card = (Suit, Rank)

let suits:[Suit] = [.Spades, .Hearts, .Diamonds, .Clubs]
let ranks = ["A", "K", "Q", "J", "10", "9", "8", "7", "6", "5", "4", "3", "2"]

func shuffled() -> [Card] {
    var cards:[Card] = []
    
    for card in suits ⨉ ranks {
        let random = Int(abs(rand())) % (cards.count + 1)
        cards.insert(card, atIndex: random)
    }
    
    return cards
}

shuffled()
    .map{(suit, rank) in suit.rawValue + rank}
    .joinWithSeparator(", ")



//: The ⨉ operator defined above also allows using `where` clause.

let range1 = 1...5
let range2 = 1...8

var sum = 0

for (x, y) in range1 ⨉ range2 where x % 2 == 0 && y % 3 == 0 {
    sum += x * y
}

sum == (2 + 4) * (3 + 6)


//: Use zip to iterate over both sequences simultaneously.

var count = 0

for (x, y) in zip(ranks, suits) {
    count += 1
}

count == 4




import Foundation

enum Suits: String {
    case Spades = "♠"
    case Hearts = "♥"
    case Diamonds = "♦"
    case Clubs = "♣"
}

let suits:[Suits] = [.Spades, .Hearts, .Diamonds, .Clubs]
let ranks = ["A", "K", "Q", "J", "10", "9", "8", "7", "6", "5", "4", "3", "2"]

infix operator ⨉ {}

func ⨉<A:SequenceType, B:SequenceType>(lhs: A, rhs: B)
    -> [(A.Generator.Element, B.Generator.Element)] {
    
    return lhs
        .map{ left in rhs.map{ right in (left, right) }}
        .reduce([], combine: +)
}

[1, 2] ⨉ [3, 4]

func shuffled() -> [String] {
    var cards:[String] = []
    
    for (suit, rank) in suits ⨉ ranks {
        let random = Int(abs(rand())) % (cards.count + 1)
        cards.insert(suit.rawValue + rank, atIndex: random)
    }
    
    return cards
}

shuffled().joinWithSeparator(" ")

// The 'times' operator defined above also works for where clause:

let range1 = 1...5
let range2 = 3...10

var sum = 0

for (x, y) in range1 ⨉ range2 where x % 2 == 0 && y % 3 == 0 {
    sum += x * y
}

sum


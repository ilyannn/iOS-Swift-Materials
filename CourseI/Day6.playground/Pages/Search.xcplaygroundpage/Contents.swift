//: [Previous](@previous)

import Foundation

let names = ["Snowball II", "Doll", "Вася", "Петя", "Илья Н", "Furry", "Santa Little Helper"]

typealias SearchResult = [(String, Int)]

func SearchResultList(inside names: [String], what found: Character) -> SearchResult {
    
    func SearchWithinString(name:String) -> SearchResult {
        
        return name
            .characters
            .enumerate()
            .filter { $1 == found }
            .map { index, _ in (name, index) }
    }
    
    return names
            .map(SearchWithinString)
            .reduce([], combine: +)
}

SearchResultList(inside: names, what: "a")

func SearchAndDisplay(inside names: [String], what found: Character) -> String {
    let results = SearchResultList(inside: names, what: found)
    return "I found \(results.count) results: " +
        results
            .map { string, index in "char \(index) in '\(string)'" }
            .reduce("") { $0 + " and " + $1 }
}

SearchAndDisplay(inside: ["Sunny", "Windy", "Hot", "Cold"], what: "n")


func square(x: Int) -> Int {
    return x * x
}

func parseAndSquare(string: String) -> Int? {
//    guard let parsed = Int(string) else { return nil }
//    return square(parsed)
    return Int(string).flatMap(square)
}

parseAndSquare("3")
parseAndSquare("jfh")

let tuple = ("sdjhf", 476, 45.0)
tuple.0
tuple.1

//: [Next](@next)

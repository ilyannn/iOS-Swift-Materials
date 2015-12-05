//: Playground - noun: a place where people can play

import UIKit

// ## Functional programming

func f(x: Int) -> String {
    return "Число\(x)"
}

let numbers = [5, 7, 8, 1, 42]

// Lazy computation
let ans = numbers.lazy.filter{ $0 % 2 == 0 }.first
ans

numbers.reduce(0, combine: +)

let evens = numbers
    .filter {$0 % 2 == 0}
    .map {"число \($0)"}
    .reverse()
    .reduce("", combine: +)

evens

//extension Int: Intable {
//    func initialValue() -> Int {
//        return 0
//    }
//}

extension SequenceType where Generator.Element == Int {

    internal func sum() -> Int {
        return reduce(0, combine:+)
    }
}

extension CollectionType where Generator.Element == Int {
    
    internal func sum() -> Int {
        return reduce(0, combine:+) + 100
    }
}

protocol Arrayable: CollectionType {
    
}

extension Arrayable where Generator.Element == Int {
    func sum() -> Int {
        return 500
    }
}

extension Array: Arrayable {
    
}

numbers.sum()
numbers.reverse().sum()

let numbers_coll: CollectionType = numbers
let answer = numbers.enumerate().lazy.map{$0.1}
answer.sum()




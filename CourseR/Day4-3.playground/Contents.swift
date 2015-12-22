//: Playground - noun: a place where people can play

import Foundation

protocol P {
    var x: Int { get }
    func f() -> Int
    func g() -> Int // определена в терминах f
}

class C {

 func c() -> Int {
    return 100
 }
    
 let x = 10
}

class D:C {

}

extension C:P {

    func f() -> Int {
        return 200
    }
}

extension P {

    func f() -> Int {
        return 300
    }

    func g() -> Int {
        return f()
    }
}

let c = C()
let p = c as P

c.f()
C.f(c)()

p.f()

c.g()
c.x
p.x

protocol MyComparable {
    func ==(a: Self, b: Self) -> Bool
}

class OrderedSet<Element: MyComparable> {
    
    var current:[Element] = []
    
    init(initial: [Element]) {
        current = initial
    }
    func addIfNotPresent(e: Element) {

        if let last = current.last where last == e {
            return
        }
        
        current.append(e)
    }
    
    convenience required init(arrayLiteral elements: Element...) {
        self.init(initial: elements)
    }
}

extension Int: MyComparable {}
extension String: MyComparable {}

extension OrderedSet: ArrayLiteralConvertible {
}

func ==(a: C, b:C) -> Bool {
    return true
}

extension C: MyComparable {

}

let collection:OrderedSet<C> = []
collection.addIfNotPresent(C())
collection.addIfNotPresent(C())
collection.addIfNotPresent(C())
collection.current

func doNothing(@noescape block:() -> ()) {
    block()
}

func repeatN(times: Int, @noescape block:() -> ()) {

    for _ in 0..<times {
        block()
    }
    
    doNothing(block)
}

class Counter {

    var count = 0
    var cycle: () -> () = {}
    
    func f() {
        
        repeatN(10) {
            count += 1
        }
        
        count
    }
}

func +(@autoclosure a:() -> Bool, @autoclosure b:() -> Bool) -> Bool {
    if a() {
        return true
    }
    return b()
}

func *(a:() -> Bool, b:() -> Bool) -> Bool {
    if a() {
        return true
    }
    return b()
}

func b() -> Bool {
    fatalError()
}

func square(x: Int) -> Bool {
    return x * x > 0
}

let x = true + square(3876485734)
let y = { true } * { square(3876485734) }

func f(x:Int) -> (y:Int, s: String) {
    return (x, x.description)
}

func greaterthan10(a:Int) -> Int? {
    return a > 10 ? a : nil
}

func sqrt(a: Int) -> Int? {
    let sq = Int(sqrt(Double(a)))
    if sq * sq - a == 0 {
        return sq
    }
    return nil
}

sqrt(10)
sqrt(100)

let val = 100

// greaterthan10(sqrt(val))

func compose(x:Int) -> Int? {
    return sqrt(x).flatMap(greaterthan10)
}

compose(900)
compose(100)
compose(7835)
compose(90384)

func array2(x: Int) -> [Int] {
    return [x, x]
}

func array3(x: Int) -> [Int] {
    return [x, x, x]
}

let compose_array_2_3:Int->[Int] = { x in array2(x).flatMap(array3) }

import UIKit

class MyView: UIView {

    func addLabel(label: UILabel!) {
        
    }
}

enum Enum {
    case First(Int)
    case Second(String, Int)
    case Third
}

func ~=( v:String, e:Enum) -> Bool {
    if case let .Second(x, y) = e  {
        return x == v && y == v.characters.count
    }
    return false
}

func isEmptyOrBobPairOfStrings(e: Enum) -> Bool {
    switch e {
    case "" : return true
    case "Bob" : return true
    default: return false
    }
}

isEmptyOrBobPairOfStrings(.Second("", 5))
isEmptyOrBobPairOfStrings(.Second("", 0))
isEmptyOrBobPairOfStrings(.Second("ss", 5))
isEmptyOrBobPairOfStrings(.Second("Bob", 5))
isEmptyOrBobPairOfStrings(.Second("Bob", 3))
isEmptyOrBobPairOfStrings(.Third)

let optx: Int? = nil
let opty: Int? = nil

var deferred = false

func F() -> Int {
    
    guard let xxx = optx else {
        return -1
    }
    
    // let file: Int = open () // RAII
    // defer { close(file) }
    
    defer { deferred = true }
    
    guard let yyy = opty else {
        return -2
    }
    
    return xxx + yyy
}

F()
deferred

var state = 5

func next() -> Int? {
    
    if (state < 0) {
        return nil
    }
    
    state -= 1
    return state
}

//while let next = next() {
//    next
//}

var array:[Int] = [6, 7]

array += [8]

while let n = next() {
    
}

//: DSL для запросов SQL

struct SQLField: StringLiteralConvertible {
    let name: String
    
    init(stringLiteral value:String) {
        name = value
    }
    
    init(unicodeScalarLiteral value: UnicodeScalar) {
        fatalError()
    }
    
    init(extendedGraphemeClusterLiteral value: String) {
        fatalError()
    }
}

typealias SQLWhere = String

func ==(field:SQLField, value: Int) -> SQLWhere {
    return "\(field.name) == \(value)"
}

func &&(query1:SQLWhere, query2: SQLWhere) -> SQLWhere {
    return "(\(query1)) && (\(query2))"
}

let PersonID:SQLField = "personID"
let PersonAge:SQLField = "personAge"

PersonID == 100 && PersonAge == 20



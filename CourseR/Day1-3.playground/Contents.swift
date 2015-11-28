//: Playground - noun: a place where people can play

import UIKit

//: Collection views

let numbers = [44, 2, 69, 33]
let reversed = numbers.reverse()

reversed[reversed.startIndex.advancedBy(1)]

numbers[2...3]


var str = "Hello, playground"
str[str.startIndex.advancedBy(5)]
let example = "😎😱"
Array(example.characters)

str[str.startIndex..<str.endIndex.advancedBy(-4)]
Array(str.utf16)[0..<3]

let result = (Array(str.characters)[0..<3])
    .map{String($0)}
    .joinWithSeparator("")

result



// example.removeRange(example.startIndex...example.startIndex)
let ns = NSString(string: example)
ns.length

// 1 unicode символ
ns.characterAtIndex(0)
ns.characterAtIndex(1)
ns.characterAtIndex(2)
ns.characterAtIndex(3)

Array(example.utf16)

Array(example.utf8)

//: Dictionary

let dict:[String: [Int]] = ["café": [30]]
dict["cafe\u{0301}"]
dict["437856"]

var d: Dictionary<String, Array<Int>> = dict
d["aaa"] = []

dict

//: Set

let set:Set<Int> = [5, 3, 6]

set.count

set == [5, 6, 3, 3]

//: struct vs class

class SomeClass {
    let const = 10
    var state = 0
}

struct SomeStruct {

    let const = 10
    var state = 0
    let cls = SomeClass()

    func read_only() -> Int {
        return const + state
    }
    
    mutating func change() {
        state = state + 1
    }
}

let cl = SomeClass()
cl.state = 1

let immutable = SomeStruct()
var mutable = SomeStruct()

// Нельзя
// immutable.state = 20
// mutable.const = 10
// immutable.change()

// Можно
mutable.state = 10
immutable.cls.state = 30
mutable.cls.state = 40
mutable.change() // mutable = новый результат работы
mutable.state

class City {
    let name: String
    var temp: Double
    
    init() {
        name = "Rio"
        temp = 40
    }
}

let city = City()

class ViewController: UIViewController {
    var cities = [City(), City()]
    
}

var currentCity = City()




//: [Previous](@previous)

import Foundation

protocol Talkable {
    func talk() -> String
    func bye() -> String
}

extension Talkable {
    func writePoem() -> String {
        return [talk(), talk(), talk(), bye()].joinWithSeparator("\n")
    }
}

extension Animal: Talkable {}

var talkable: Talkable = Animal(name: "Bull")
talkable.talk()
talkable.bye()
talkable.writePoem()

let frog = Animal(name: "Frog")
frog.writePoem()

class Radio: Talkable {
    func talk() -> String {
        return "Welcome to this program"
    }
    
    func bye() -> String {
        return "Have a good sleep"
    }
}

var array: Array<Talkable> = [frog]
array.append(Radio())

array

let result = array
    .map({ talkable in talkable.talk() })
    .joinWithSeparator("\n")

result

//: [Next](@next)

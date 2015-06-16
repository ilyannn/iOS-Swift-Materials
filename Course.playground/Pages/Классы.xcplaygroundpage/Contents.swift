//: [Previous](@previous)

import UIKit

class Animal {
//    func numberOfLegs() -> Int {
//        fatalError("Не знаю")
//    }
}

// Animal().numberOfLegs() - не работает 
protocol Standable {
    func numberOfLegs() -> Int
}

class Spider: Animal, Standable {
    func numberOfLegs() -> Int {
        return 8
    }
}

class Domestic: Animal, CustomPlaygroundQuickLookable {
    let animalName: String
    
    init(name: String) {
        animalName = name
    }

    func numberOfLegs() -> Int {
        return 4
    }
    
    func say() -> String {
        return ""
    }
    
    func customPlaygroundQuickLook() -> PlaygroundQuickLook {
        guard let image = UIImage(named: imageName()) else { return PlaygroundQuickLook(reflecting: "") }
        return PlaygroundQuickLook(reflecting: image) 
    }
    
    func imageName() -> String {
        return ""
    }
}

class Cat: Domestic {
    override func imageName() -> String {
        return "cat.jpg"
    }
    
    override func say() -> String {
        return "Meow"
    }
}

class Dog: Domestic {
    override func imageName() -> String {
        return "dog.jpg"
    }
    
    override func say() -> String {
        return "Woof"
    }
}

let snowball_II = Cat(name: "Snowball II")
let objects = [Dog(name: "Шарик"), Dog(name: "Fido"), snowball_II, Spider()]
let legs = (objects as [Standable]).map { $0.numberOfLegs() } 
legs

let total = legs.reduce(0, combine: +)

protocol Talkable {
    func say() -> String
}

class Alarm: Talkable {
    func say() -> String {
        return "Bzzzz"
    }
}

extension Domestic: Talkable {}

let noises: [Talkable] = [snowball_II, Dog(name: "Santa's Little Helper"), Alarm()]

snowball_II.say()

let noise = " and ".join(noises.map{$0.say()})
noise

//: [Next](@next)

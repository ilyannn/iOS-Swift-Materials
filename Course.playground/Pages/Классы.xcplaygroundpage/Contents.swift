//: [Previous](@previous)

import UIKit

public class Animal {
//    func numberOfLegs() -> Int {
//        fatalError("Не знаю")
//    }
}

// Animal().numberOfLegs() - не работает 
protocol Standable {
    func numberOfLegs() -> Int
}

class Spider: Animal {

}


extension Spider: Standable {
    func numberOfLegs() -> Int {
        return 8
    }
}



public class Domestic: Animal, CustomPlaygroundQuickLookable {
    let animalName: String
    
    public init(name: String) {
        animalName = name
    }

    final func numberOfLegs() -> Int {
        return 4
    }
    
    public func say() -> String {
        return ""
    }
    
    public func customPlaygroundQuickLook() -> PlaygroundQuickLook {
        guard let image = UIImage(named: imageName()) else { return PlaygroundQuickLook(reflecting: "") }
        return PlaygroundQuickLook(reflecting: image) 
    }
    
    func imageName() -> String {
        return ""
    }
    
    private func numberOfEyes() -> Int {
        return 2
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

extension Domestic: Standable {
    
}

let snowball_II = Cat(name: "Snowball II")
snowball_II.numberOfLegs()


let objects:[Standable] = [Dog(name: "Шарик"), Dog(name: "Fido"), snowball_II, Spider()]

let legs = objects.map{ return $0.numberOfLegs() }

legs

////let legs = (objects as [Standable]).map { $0.numberOfLegs() } 
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

let result = " + ".join(noises.map { $0.say() })
result

//: [Next](@next)

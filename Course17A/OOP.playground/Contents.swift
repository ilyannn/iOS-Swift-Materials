//: Playground - noun: a place where people can play

import UIKit

let numbers = [6, 5, 1]

import AVFoundation
let synthesizer = AVSpeechSynthesizer()


class Animal {
    
    func talk() {
        synthesizer.speak(AVSpeechUtterance(string: sound()))
    }
    
    func sound() -> String {
        return ""
    }
}

class Cat: Animal {

    override func sound() -> String {
        return "Meow"
    }
}

class Dog: Animal {

    let breedName: String
    
    init(breed: String) {
        breedName = breed
    }
    
    override func sound() -> String {
        return "Woof, I am \(breedName)"
    }
}

class Human: Animal {

    let firstName: String
    let lastName: String
    
    init(firstName first: String, lastName last: String) {
        firstName = first
        lastName  = last
    }
    
    override func sound() -> String {
        return "Hello, my name is \(firstName)"
    }
}


let myCat = Cat()
let myDog = Dog(breed: "German Shepherd")
let pets = [myCat, myDog]

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

let jack = Human(firstName: "Jack", lastName: "Daniels")
// jack.talk()

// квадратный трехчлен
func трехчлен(a:Double, b:Double, c:Double, x:Double) -> Double {
    return a * x * x + b * x + c
}

func трехчлен(_ a:Double, _ b:Double, _ c:Double, _ x:Double) -> Double {
    return a * x * x + b * x + c
}

// квадратный трехчлен
func трехчлен(quadraticPart a:Double, linearPart b:Double, constant c:Double, atPoint x:Double) -> Double {
    return a * x * x + b * x + c
}

трехчлен(a: 5, b: 0, c: 0, x: 1)
трехчлен(quadraticPart: 3, linearPart: 2, constant: 10, atPoint: 3)

трехчлен(6, 12, 3, 5)


//: [Previous](@previous)

import UIKit

var point1 = CGPoint(x: 5, y: 2.3) // <- структура
var point2 = point1
point1.x = 10

point1.x
point2.x

let size = CGSize(width: 10, height: 20)
let rect = CGRect(origin: point1, size: size)

let vector = CGVector(dx: 4, dy: 3)

class Object: NSObject { // NS = NextStep
    var x: Double
    var y: Double
    var z: Double
    
    init(x: Double, y: Double, z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }
}


class Spaceship: Object {
    let name: String

    var color: UIColor = .grayColor() // <- сокращение
    
    init(name: String) {
        self.name = name
        
        super.init(x: 32, y: 16, z: 67)
    }
}

let falcon = Spaceship(name: "Millenium Falcon")
falcon.name

falcon.x
falcon.x = 33

falcon.x

let hanSolosShip = falcon
let chubakkaPiloted = falcon

chubakkaPiloted.x = 100
hanSolosShip.x


let object1 = Object(x: 5, y: 6, z: 7)
let object2 = Object(x: 5, y: 6, z: 7)

object1 == object2

let deathStar = Spaceship(name: "Death Star")
deathStar.name

falcon.color = UIColor.redColor().colorWithAlphaComponent(0.1).colorWithAlphaComponent(1)


//: [Next](@next)

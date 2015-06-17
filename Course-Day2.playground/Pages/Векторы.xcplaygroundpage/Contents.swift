//: [Previous](@previous)
import Foundation

Canvas()

struct Vector: CustomPlaygroundQuickLookable {
    let dx: Double
    let dy: Double
    
    func customPlaygroundQuickLook() -> PlaygroundQuickLook {
        return CanvasQuickLook {canvas in
        	canvas.drawVector(dx: dx, dy: dy)
        }
    }
    
    func length() -> Double {
        return sqrt(dx * dx + dy * dy)
    }
}

Vector(dx: 1, dy: 1).length() * 3 - Vector(dx: 3, dy: 3).length()

let A =  Vector(dx: 4, dy: 0)

func +(a: Vector, b: Vector) -> Vector {
    return Vector(dx: a.dx + b.dx, dy: a.dy + b.dy)
}

func -(a: Vector, b: Vector) -> Vector {
    return Vector(dx: a.dx - b.dx, dy: a.dy - b.dy)
}

func *(a: Double, b: Vector) -> Vector {
    return Vector(dx: a * b.dx, dy: a * b.dy)
}

prefix func -(a: Vector) -> Vector {
    return (-1) * a
}

func ==(a:Vector, b:Vector) -> Bool {
    return a.dx == b.dx && a.dy == b.dy
}

let B = Vector(dx: 0, dy: 1)

A + B + B + (-A) == 2 * B

2 * B + A

let π = M_PI

A

//: Поворот вектоа, который смотрит направо
let angle = π / 10
let length = 4.0
Vector(dx: length * cos(angle), dy: length * sin(angle))

//: Поворот вектоа, который смотрит наверх
Vector(dx: length * cos(angle + π/2), dy: length * sin(angle + π/2))


extension Vector {
    func rotate(angle: Double) -> Vector {
//        let направо = Vector(dx: dx * cos(angle), dy: dx * sin(angle)) 
//        let наверх = Vector(dx: dy * cos(angle + π/2), dy: dy * sin(angle + π/2)) 
//        return направо + наверх
        
        return Vector(
            dx: dx * cos(angle) - dy * sin(angle) , 
            dy: dx * sin(angle) + dy * cos(angle)
        )
    }
}

let original = Vector(dx: 3, dy: 3)
let rotated = Vector(dx: 3, dy: 3).rotate(π/4)

struct Diagram: CustomPlaygroundQuickLookable {
    let vectors: [Vector]
    
    func customPlaygroundQuickLook() -> PlaygroundQuickLook {
        return CanvasQuickLook {canvas in
            for vector in vectors {
                canvas.drawVector(dx: vector.dx, dy: vector.dy)
            }
        }
    }
}

Diagram(vectors: [original, original.rotate(π/5), original.rotate(20 / 180.0 * π)])



//: [Next](@next)

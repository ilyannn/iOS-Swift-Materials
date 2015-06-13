//: [Дальше](@previous)

//: Векторы

import Foundation

struct Vector: CustomPlaygroundQuickLookable {
    let dx: Double
    let dy: Double
    
    func rotate(angle: Double) -> Vector {
        let new_dx = dx * cos(angle) - dy * sin(angle)
        let new_dy = dy * cos(angle) + dx * sin(angle)
        return Vector(dx: new_dx, dy: new_dy)
    }

    func length() -> Double {
        return sqrt(dx * dx + dy * dy)
    }
    
    func customPlaygroundQuickLook() -> PlaygroundQuickLook {
        return CanvasQuickLook { canvas in
            canvas.drawVector(dx: dx, dy: dy)
        }
    }
}

func +(a:Vector, b:Vector) -> Vector {
    return Vector(dx: a.dx + b.dx, dy: a.dy + b.dy)
}

func *(a:Double, b:Vector) -> Vector {
    return Vector(dx: a * b.dx, dy: a * b.dy)
}

func -(a:Vector, b:Vector) -> Vector {
    return a + (-1) * b
}


let π = M_PI // Alt + P


let right = Vector(dx: 2, dy: 0)
let rotated = right.rotate(π/3)
 rotated - right

struct VectorSubtraction: CustomPlaygroundQuickLookable {
    let A: Vector
    let B: Vector

    func customPlaygroundQuickLook() -> PlaygroundQuickLook {
        let C = B - A
        return CanvasQuickLook{ canvas in
            canvas.drawVector(dx: A.dx, dy: A.dy)
            canvas.drawVector(dx: B.dx, dy: B.dy)
            canvas.drawLine(toX: B.dx, toY: B.dy, fromX: A.dx, fromY: A.dy, asVector: true)
            canvas.drawVector(dx: C.dx, dy: C.dy)
        }
    }
}

VectorSubtraction(A: rotated, B: right)


struct ВписанныйТреугольник: CustomPlaygroundQuickLookable {
    func customPlaygroundQuickLook() -> PlaygroundQuickLook {
        return CanvasQuickLook{ canvas in
            let center = (1.0/3.0) * (right + rotated)
            canvas.drawArc(radius: center.length(), centerX: center.dx, centerY: center.dy, startAngle: 0, endAngle: 2*π)

            canvas.drawLine(toX: right.dx, toY: right.dy, fromX: 0, fromY: 0, asVector: true)
            canvas.drawLine(toX: rotated.dx, toY: rotated.dy, fromX: right.dx, fromY: right.dy, asVector: true)
            canvas.drawLine(toX: 0, toY: 0, fromX: rotated.dx, fromY: rotated.dy, asVector: true)
        }
    }
}

ВписанныйТреугольник()
struct Circle: CustomPlaygroundQuickLookable {
    func customPlaygroundQuickLook() -> PlaygroundQuickLook {
        return CanvasQuickLook { canvas in
        	canvas.drawArc(radius: 1, centerX: 1, centerY: 1, startAngle: 0, endAngle: 2*π)
        }
    }
}

Circle()

struct Polygon: CustomPlaygroundQuickLookable {
    let vertices: [Vector]
    
    func customPlaygroundQuickLook() -> PlaygroundQuickLook {
        return CanvasQuickLook{ canvas in
            
        }
    }
}

//: [Назад](@next)

//: [Дальше](@previous)

//: Векторы

import Foundation

struct Вектор {
    let dx: Double
    let dy: Double
    
    func rotate(angle: Double) -> Вектор {
        let new_dx = dx * cos(angle) - dy * sin(angle)
        let new_dy = dy * cos(angle) + dx * sin(angle)
        return Вектор(dx: new_dx, dy: new_dy)
    }
}

extension Вектор: CustomPlaygroundQuickLookable {
    func customPlaygroundQuickLook() -> PlaygroundQuickLook {
        return VectorViewQuickLook(dx:dx, dy: dy)
    }
}


let π = M_PI // Alt + P


let right = Вектор(dx: 3, dy: 0)
right.rotate(π/3)


//: [Назад](@next)

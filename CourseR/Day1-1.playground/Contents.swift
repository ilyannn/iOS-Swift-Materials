//: Playground - noun: a place where people can play

//: ## Type system

let курс$ = 69.9
let iPhone = 700.00

курс$ * iPhone

let 😎 = "строка"

func a(x:Int) -> Double {
    return 1
}

func a(x:Int) -> Int {
    return 2
}


let _:Int = a(45)
let _:Double = a(45)

import Foundation


protocol MyProtocol {
    
}


class MyClass: NSObject, MyProtocol {
    
    var superOptional: Int???

    // - initWithNumberOfObjects:(NSInteger)count
    init(numberOfObjects count:Int) {
        
    }
    
    init(initialValue value:Int) {
        value
    }
    
    func swizzable() -> Int {
        return 2
    }
}

let object = MyClass(initialValue: 50)

object
object.swizzable()



func ambiguous(x: MyProtocol) -> String {
    return "protocol"
}

func ambiguous(x: NSObject) -> Int {
    return 2
}

// let number = MyClass(Int(45))

//: ## Signatures

func computeAtPoint(point x: Double,
    k a:Double = 1,
    _ b:Double = 0,
    const c:Double = 0)
    
-> Double {
    
    let result =
        a * x * x +
        b * x +
        c
    
    let number = 34
    
    print(number)
    
    return result
}

func computeAtPoint(x: Double,
    _ a:Double = 1,
    _ b:Double = 0,
    _ c:Double = 0)
    
    -> Double {
        
        let result =
        a * x * x +
            b * x +
        c
        
        let number = 34
        
        print(number)
        
        return result
}


computeAtPoint(point: 10, k: 3, 0, const: 1)
computeAtPoint(point: 4, 5, const: 6, k: 5)

class Computer {
    
    func computeAtPoint(x: Double,
        a:Double = 1,
        b:Double = 0,
        c:Double)
        
        -> Double {
            
            let result =
            a * x * x +
                b * x +
            c
            
            let number = 34
            
            print(number)
            
            return result
    }
}

let computer = Computer()

computer.computeAtPoint(10, a: 3, b: 0, c: 1)

import UIKit

let button = UIButton(frame: CGRectZero)


//: ## Final

class SwiftClass {
    
    func finality() -> Int {
        return 2
    }
}


private class FinalClass: SwiftClass {
    
    override func finality() -> Int {
        return 3
    }
}


SwiftClass().finality()

private func compute(x: FinalClass) {
    if x.finality() < 2 {
        
    }
}







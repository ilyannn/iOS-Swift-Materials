//: Playground - noun: a place where people can play

private class A {

    func x() -> Int {
        return 5
    }
}

private func f(x:A) -> Int {
    return x.x()
}


private let l = f(A())

func f() -> Int {
    return shifted(by: 1)(10)
}

func shifted(by value: Int) -> Int -> Int {

    return {
        $0 + value
    }
    
}

f()

func mutable(var by value: Int = 0) -> Int -> Int {
    
    return {
        $0 + (value++)
    }
    
}

let mut = mutable()
let mut2 = mutable()
let mut3 = mut

mut(10)
mut(10)
mut2(10)
mut(10)
mut3(10)
mut(10)
mut2(10)
mut(10)

struct Iterator:GeneratorType {
    let f = mutable()
    
    func next() -> Int? {
        return f(10)
    }
}

let i = Iterator()
i.next()
i.next()
i.next()

func stuff(initial: Int) -> (Int -> Int, Int -> Int, () ->Void) {

    var mut = initial // getter & setter
    
    let closure = {(a:Int) in a + mut}
    
    func fun(a: Int) -> Int {
        // захватил mut getter
        return a + mut
    }
    
    func inc_mut() {
        // захватил mut getter, setter
        mut += 1
    }
    
    return (closure, fun, inc_mut)
}

// C: f(void) { ... }
// g() { ... }
// f(4) - нельзя
// g(4) - можно

let stuff10 = stuff(10)
let fun = stuff10.1
let inc_mut = stuff10.2

fun(1)
fun(1)
inc_mut()
fun(1)
fun(1)
inc_mut()
fun(1)

class Test {
    
    var a:(Int) -> Int = { v in 0  }
    var b:(Int) -> Int = { v in 0 }
    
    // let f = что-то
    func f(x: Int) -> Int {
        return g(x)
    }
    
    func g(x: Int) -> Int {
        if x == 0 {return 100}
        return f(x-1) + x
    }
    
    init() {
        b = { v in self.a(v) }
        a = { v in v == 0 ? 0: self.b(v-1) + 1 }
    }
}

let test = Test()

let capturedf = Test.f(test)
test.f

test.b(10)
test.f(10) == 100 + 10 * (10 + 1) / 2

let noncapturedg = Test.g
let capturedg = noncapturedg(test)
let capturedg2 = test.g

// на самом деле capturedg == capturedg2



import UIKit

UIImage(named:"b.jpg")


let x = X(initial: 50)

x.method()
x.property
x.attemptSetProperty(20)

x.property
x.property

let beautiful = [#Image(imageLiteral: "beatiful-folhas-nature-Favim.com-204131.jpg")#]
let cyan = [#Color(colorLiteralRed: 0, green: 1, blue: 1, alpha: 1)#]

let angry = [#Image(imageLiteral: "unnamed.png")#]

x.observable
x.observablePlus1

x.observable = 100
x.observablePlus1

class Base {
}

class Derived: Base {
    
}

class AA:NSObject {
    
    private var v_: Int = 0
    
    var v:Int { get {
        return v_
    }
        set {
            v_ = newValue
        }
    }

    var readonly: Base {
        return Base()
    }
    
    var readwrite: Base { get {
        return Base()
    } set {
        setReadWrite(newValue, parameters: [])
    }}
    
    func setReadWrite(value: Base, parameters: Set<Int>) {
        
    }
}

class BB:AA {

    override var readonly: Derived {
        return Derived()
    }

    override var v: Int {
        
        didSet {
            if v != 15 {
                v = 15
            }
        }
    }
    
    func f() {
        let _ = readonly
    }

    override func setReadWrite(value: Base, parameters: Set<Int>) {
        
    }
}

let bb = BB()

bb.v = 20
bb.v_
bb.v




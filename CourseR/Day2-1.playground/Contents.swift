//: Playground - noun: a place where people can play

// A B
// Произведение множеств A ⨉ B - (a, b)

var object: (index: Int, value:String)

object = (5, "string")
object = (index:6, value: "string")

object.0
object.1

//object = (i:6, v: "string")

class Cl {
func f(index: Int, value:String) {
    
}
}

let obj = Cl()

obj.f(6, value: "str")
let unnamed = (6, "str")

object.index
import Foundation

protocol P {
    func doSomething() -> String
}

struct S: P {
    var index: Int
    var value: String
    
    func doSomething() -> String {
        return ""
    }
}

typealias OptionalNSURL = Optional<NSURL>
let url:NSURL? = NSURL(string: "http://google.com")

// Объединение множеств A ∪ B

enum E<T>: P {
    case A(number: T)
    case B(String)
    case C(Int, b: T, T)
    
    func doSomething() -> String  {
        switch self {
            case .A(let i): return "Число \(i)"
            case .B(let s): return "Строка \(s)"
            case .C: return ""
        }
    }
}


let a = E.A(number: 5)
let b:E<NSURL> = .B("xxx")

a.doSomething()
b.doSomething()

if case let .A(number) = a {
    number
}

if case let .C(a, b, c) = E.C(4, b: 5, 6) {
    a
}

//: ## Co(ntra)variance

class Base {
    
    func f() -> Int {
        return 1
    }
    
    func g() -> Base {
        return self
    }
    
    func h(arg: Derived) {
        
    }
    
    func i(arg:Base) -> Int {
        return 1
    }
 
    // свойство read-only property типа Base
    // covariant!
    func getProperty() -> Base {
        return Base()
    }
    
    // свойство write-only property типа Base
    // contravariant!
    func setProperty(value:Derived) {
        
    }

    // свойство read-write property типа T
    // invariant!
    
}

class Derived: Base {

    override func f() -> Int {
        return 2
    }
    
    override func g() -> Derived { // covariant
        return self
    }
    
    override func h(arg: Base) { // contravariant
        
    }
    
    func i(arg: Derived) -> Int {
        return 2
    }
    
    override func getProperty() -> Derived {
        return Derived()
    }
    
    override func setProperty(value:Base) {
        
    }
}

func f(x: Base) {
    
}

func f(x: Derived) {
    
}


let base = Base()
let derived = Derived()

base.f()
derived.f()

let basef = Base.f
let derivedf = Derived.f

basef(base)        ()
basef(derived)     ()
derivedf(derived)  ()

base.f             ()
derived.f          ()

// По факту равенство basef(объект) == объект.f

let d: Base = derived


f(base)
f(derived)

var array:[Base]
array = [derived, derived]

base.i(base)

derived.i(base)
derived.i(derived as Base)
var d_base: Base
d_base = derived
derived.i(d_base)

// static vs dynamic
// ObjC: message dispatch
// C++: vtable dispatch 
// Swift: ^^ разные методы

func f(inout arg: [Base]) {
    arg += [base]
}

func f(arg: [Base]) {

}

var derivedc:[Base] = [derived]
f(&derivedc)
derivedc

var numbers = [44, 6]

numbers.sort()
numbers.sortInPlace()

struct State {
    
    var state = 0

    // sort(self, a)
    func sort(a: Int) {
        
    }
    
    // sort (self, inout change)
    func sort(inout change: Int) {

    }

    // sortInPlace (inout self, a)
    mutating func sortInPlace(a: Int) {
        self = State()
    }
    
    // sortInPlace (inout self, inout change)
    mutating func sortInPlace(inout change: Int) {
        self = State()
    }
}

//: ## Optional


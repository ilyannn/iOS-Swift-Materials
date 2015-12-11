//: Playground - noun: a place where people can play

//: Монада Result

import Foundation

enum Result<T> {
    case Success(T)
    case Error(String)
}

func sq(x: Int) -> Result<Int> {
    
    let sq = Int(sqrt(Double(x)))
    
    if sq * sq == x {
        return .Success(sq)
    }
    
    return .Error("Нельзя извлечь точно")
}

sq(4)
sq(5)

func half(x: Int) -> Result<Int> {
    
    let half = x / 2
    
    if half * 2 == x {
        return .Success(half)
    }
    
    return .Error("Нельзя поделить точно")
}

half(10)
half(11)


func *<T, U, W>(g:U -> Result<W>, f: T -> Result<U>) -> T -> Result<W>
{
    return { t in
        
        switch f(t) {
        case .Error(let string): return .Error(string)
        case .Success(let u): return g(u)
        }
    }
}


let half_sq = half * sq
// half(sq(x))

half_sq(100)
half_sq(65)
half_sq(49)


//: Монада Async

// half: Int -> Future<Int> // асинхронной
// sq: Int -> Future<Int> // асинхронная

// half * sq: Int -> Future<Int> 
// сначала одно, к результату применить

// C# - async await
// Haskell - синтаксис async { код }
// Swift - приходите #swift-evolution

//: Concurrency
// @property (atomic) - обычно не самый подходящий уровень
// правильно - NSOperationQueue, dispatch_async(...)




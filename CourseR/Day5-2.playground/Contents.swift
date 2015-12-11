//: Playground - noun: a place where people can play

import Foundation

//: Обработка throw

struct NumericError:ErrorType {
    let message: String
    let arguments: [Int]
}

func sq_t(x: Int) throws ->  Int  {
    
    let sq = Int(sqrt(Double(x)))
    
    if sq * sq == x {
        return sq
    }
    
    throw NumericError(
        message: "Нельзя извлечь точно",
        arguments: [x]
    )
}

func f() throws -> Int {
    
    let a = try sq_t(4)
    let b = try sq_t(5)
    
    return a + b
}

enum RetrieveError: ErrorType {
    case BadURL
    case NoData
    case BadData
}

func |<X: OptionSetType>(lhs: X, rhs: X) -> X {
    return lhs.union(rhs)
}

let options: NSDataReadingOptions = [.DataReadingUncached]
let options2 = options | NSDataReadingOptions.DataReadingMapped
options2.rawValue

func retrieve() throws -> String {

    guard let url = NSURL(string: "http://stackoverflow.com/questions/5168331/why-is-atomic-a-default-property-qualifier-in-objective-c-when-i-find-myself") else
    {
        throw RetrieveError.BadURL
    }

    let data = try NSData(contentsOfURL: url, options: options)
    
    guard let string = NSString(data: data, encoding: 4) else {
        throw RetrieveError.BadData
    }
    
    return string as String
}

try retrieve()

// try f()

//func g() -> Int {
//    guard let sq = try? sq_t(10) else {
//        return -1
//    }
//    return sq
//}
//
//g()

//func half_t(x: Int) throws ->  Int {
//    
//    let half = x / 2
//    
//    if half * 2 == x {
//        return half
//    }
//    
//    throw NumericError(
//        message: "Нельзя поделить точно",
//        arguments: [x]
//    )
//}

// try half_t(10)
// try half_t(11)

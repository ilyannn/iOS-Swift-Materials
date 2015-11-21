//: Playground - noun: a place where people can play

import Foundation

let formatter =  NSNumberFormatter()

formatter.numberFromString("5")
formatter.numberFromString("sdjf")

func compute(string: String) -> Int {
    
    if let number = formatter.numberFromString(string) {
        return number.integerValue + 10
    }
    
    return -1
}


func compute_ifelse(string: String) -> Int {

    let number = formatter.numberFromString(string)

    if number != nil {
        return number!.integerValue + 10
    } else {
        return -1
    }
}

func compute_short(string: String) -> Int {
    
    return (formatter.numberFromString(string)?.integerValue ?? -11 )
        + 10

}
compute_short("6")
compute_short("dskjfh")

compute("6")
compute("sdjfh")
compute("837465")

func compute_force(string: String) -> Int {
    
    let number = formatter.numberFromString(string)!
    return number.integerValue + 10
}

func compute_maybe(string: String) -> Optional<Int> {
    
    if let number = formatter.numberFromString(string) {
        return number.integerValue + 10
    }
    
    return nil
}

compute_force("5")

compute_maybe("5")
compute_maybe("weiour")





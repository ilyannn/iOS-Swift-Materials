//: Playground - noun: a place where people can play

import UIKit

//: Шифр: надо разбить строку на части, оставить числа 
//: прибавить 10 к числам и преобразовать в буквы


let str = "Hello playground 62 hey 59 i'm 66 great 70 Weather is great at coordinates 68 69"





str
    .componentsSeparatedByString(" ")
    .flatMap { Int($0) }
    .map { $0 + 17 }
    .map (UnicodeScalar.init)
    .map (Character.init)

for part in str.componentsSeparatedByString(" ") {
    guard let integer = Int(part) else { continue }
    let char = Character(UnicodeScalar(integer + 10))
    print(char)
}

func decode(message: String) -> String {
    
    let characters = message
        .componentsSeparatedByString(" ")
        .flatMap {
            Int($0)
        }.map {
            $0 + 10
        }.map {
            Character(UnicodeScalar($0))
        }
    
    return String(characters)
}








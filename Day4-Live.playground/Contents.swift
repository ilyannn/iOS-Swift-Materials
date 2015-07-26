//: Playground - noun: a place where people can play

import UIKit

//: Шифр: надо разбить строку на части, оставить числа
//: прибавить 10 к числам и преобразовать в буквы

let message = "Hello playground 62 I'm at the beach 59 i'm 66 great 70 Weather is great at coordinates 68 69 and 77"

// Язык C:
// char a = 'A'
// char a = 65

Character(UnicodeScalar(65))

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

decode("Hey weather is 77 69 77")
decode(message)

//: ## for

"something".characters.reverse().sort()

for char in "something".characters.reverse().sort() {
    print(char)
}

func decode_for(message: String) -> String {
    let chunks = message.componentsSeparatedByString(" ")

    var result = ""
    
    for index in 0..<chunks.count {
        
        let chunk = chunks[index]
        
        if let integer = Int(chunk) {
            
            let added = integer + 10
            let char = Character(UnicodeScalar(added))
            
            result += String(char)
            
        }
    }
    
    return result
}

decode_for("Hey weather is 77 69 77")
decode_for(message)


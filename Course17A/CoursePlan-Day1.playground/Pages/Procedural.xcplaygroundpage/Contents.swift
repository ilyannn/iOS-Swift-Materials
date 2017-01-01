//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

// strings, views

str.characters.count
Array(str.characters)

// NSString

let greeting = str.replacingOccurrences(of: "playground",
                                        with: "everyone")

let emoji = "😎"
emoji.characters.count
(emoji as NSString).length

// let, var

str.append("!")
str
str.characters.count

// for, if, процедурный стиль
// более оптимальный вариант решета Эратосфена

var primes = [2]

//for n in 3...100 {
//    let divisors = primes.lazy.filter {
//        n % $0 == 0
//    }
//    if divisors.isEmpty {
//        primes.append(n)
//    }
//}

for n in 3...100 {
    
    var flag = true

    for p in primes {
        if n % p == 0 {
            flag = false
            break
        }
    }
    
    if flag {
        primes.append(n)
    }
}

// Дополнительная Тема: изучить эти операторы

primes


//: [Next](@next)

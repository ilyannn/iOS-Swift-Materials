//: Playground - noun: a place where people can play

//: # Xcode, playgrounds

//: *Если вы видите слева от этой надписи символы слэша и двоеточия, то можно выбрать в меню Editor -> Show Rendered Markup и увидеть красивый текст.*


import UIKit
var str = "Hello, playground"



//: ## Калькулятор
//: Мы можем использовать playground как интерактивный калькулятор.

// calculations, Int, String, Double
// let - bind a name 

let четыре = 2 + 2

let € = 64.82 // Alt + Shift + 2
let echo_dot = 59.99 * €

"Echo обойдется в \(179.99 * €) рублей"
"Echo Dot обойдется в \(59.99 * €) рублей"

4 * €
Double(четыре) * €

"Hello" + ", " + "world"

// операторы /,  %
// у каждого имени свой тип

30   / 8
30   % 8
30.0 / 8.0
//- 30.0 % 8.0



// arrays

let numbers = [5, 12, 2, 17]

numbers + numbers + [16] + []

//- let something = []
//- numbers * 2


// dot-notation

let greeting = str.replacingOccurrences(of: "playground",
                                        with: "everyone")

numbers.first
numbers.sorted().first
numbers.min()
numbers.count


// strings, views

str.characters.count
Array(str.characters)


// map

numbers.map {
    x in x * x
}

numbers.map {
    x in x % 10
}

// сравнение < > ==, Bool

let истина = 2 + 2 == 4
истина


// func

let divisors = (1 ... 7).filter {
    x in 7 % x == 0
}

divisors == [1, 7]

// reduce

let sum = numbers.reduce(0, +)

func sum_sq(input: [Int]) -> Int {
    return input
            .map{ x in x * x }
            .reduce(0, +)
}

let year = 2017
let welcome = "Happy \(year)! Let's celebrate in a café!"


sum_sq(input: [44, 9].sorted())


// let, var

str.append("!")
str

// NSString

let emoji = "😎"
emoji.characters.count
(emoji as NSString).length


//: *Вы можете перейти на другую страницу в playground, выбрав ее слева в навигаторе. Если навигатора не видно, нажмите `cmd + 1`, а для скрытия `cmd + 0`*


// Speech

//import PlaygroundSupport
//PlaygroundPage.current.needsIndefiniteExecution = true
//
//import AVFoundation
//
//let what  = AVSpeechUtterance(string: welcome)
//let who   = AVSpeechSynthesizer()
//
//let greet = AVSpeechUtterance(string: greeting)
//greet.pitchMultiplier    = 2.1
//greet.postUtteranceDelay = 0.4
//
//who.speak(greet)
//who.speak(what)

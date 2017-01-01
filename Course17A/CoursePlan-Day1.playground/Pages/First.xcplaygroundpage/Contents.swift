//: Playground - noun: a place where people can play

//: ## Xcode, playgrounds

//: *Если вы видите слева от этой надписи символы слэша и двоеточия, то можно выбрать в меню Editor -> Show Rendered Markup и увидеть красивый текст.*

//: Мы можем использовать playground как интерактивный калькулятор.

//: calculations, Int, String, Double
//: let - bind a name

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



// ## arrays

let numbers = [5, 12, 2, 17]

numbers + numbers + [16] + []

//- let something = []
//- numbers * 2


// ## dot-notation

numbers.first
numbers.sorted().first
numbers.min()
numbers.count




// map

numbers.map { x in
    x * x
}

numbers.map { x in
    x % 10
}

// сравнение < > ==, Bool

let истина = 2 + 2 == 4
истина

// filter

(1 ... 10).filter { x in
    10 % x == 0
}

// func

func isPrime(number: Int) -> Bool {
    let divisors = (1 ... number).filter {
        x in number % x == 0 // каждый раз number операций
    }
    
    return divisors == [1, number]
}

isPrime(number: 6)
isPrime(number: 2017)

(1 ... 100) .filter(isPrime)



// reduce

let sum = numbers.reduce(0, +)

func sum_sq(input: [Int]) -> Int {
    return input
            .map{ x in x * x }
            .reduce(0, +)
}

let year = 2017
let welcome = "Happy \(year)! Let's celebrate in a café!"

sum_sq(input: [6, 7, 8, 9])
sum_sq(input: [44, 9].sorted())

// Дополнительная Тема: написать функцию которая ищет представление в виде суммы двух квадратов



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

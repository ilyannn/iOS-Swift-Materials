//: Playground - noun: a place where people can play

import UIKit

5435 + 2398457

let count = 12
count * 10


let € = 63.06
let echo_dot = 59.99 * €
let echo = 179.99 * €

let red = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)



"Hello" + ", " + "world"

"Стоимость Echo Dot в рублях \(echo_dot)"
"Стоимость Echo в рублях \(echo)"
"Стоимость Amazon Fire в рублях \(59 * €)"

4 * 8 + 1
33 / 8
33 % 8

4 * 8 + 2
34 / 8
34 % 8

4 * 8 + 3
35 / 8
35 % 8

5 * 8 + 0
40 / 8
40 % 8


33 / 8
33   % 8

33.0 / 8.0




4 * €


// Массивы

let numbers = [5, 2, 12]
let имена   = ["Катя", "Вася", "Петя"]
let 😎 = имена + ["Коля", "Настя"]

let array = [5 as NSObject , "Петя" as NSObject, red]

😎.count
😎.sorted()

😎.min()
😎 + 😎
😎[1]

let π = 3.1415
let сумма_5_€ = 5 * €

// строки

let string = "👨‍👩‍👦‍👦 went to the 🇮🇹 café. 🙎🏾‍♂️ ate 🍰, 👱🏻‍♀️ ate 🍦"
Array(string.characters)[0]


// map

numbers
numbers.map { x in
    2 * x
}

numbers.map { number in
    number * 100
}

numbers.map { number in
    number.description
}

😎.map {
    строка in строка.uppercased()
}

numbers.map { x in
    x * x
}

numbers.map { x in
    x % 2
}


// 5, 2, 12
// 0, 1, 2

let истина = 2 + 2 == 4
истина
Int(false)
Int(true)

2 + 2 == 5
2 + 2 < 4
2 + 2 >= 4

10 < 12
10 > 12

true
false
true == false

😎.map { строка in
    Array(строка.characters)[0]
}.sorted()


[(1, 2)].enumerated().map { index, pair in
    let (first, second) = pair
    index + pair.0 + second
}

// tuple

let data = [
    (420, 2, "Поездка на Аэроэкспрессе"),
    (50, 10, "Поездка на метро"),
    (500, 1, "Штраф за превышение скорости"),
    (67454.99, 1, "iPhone 7 Plus")
]

data.map { price, quantity, text in price * Double(quantity) }.sorted()

data.enumerated().map { index, тройка in
    "\(index+1)) \(тройка.2) – \(тройка.1)шт, сумма € \(тройка.0 * Double(тройка.1) / €)"
}



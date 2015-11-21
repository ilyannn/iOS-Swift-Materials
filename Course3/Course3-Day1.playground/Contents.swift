//: Playground - noun: a place where people can play

//: ## Числа

//: *Если вы видите слева от этой надписи символы слэша и двоеточия, то можно выбрать в меню Editor -> Show Rendered Markup и увидеть красивый текст.*

5 + 6

let first = 6
let second = 69

6 * 69
first * second

let курс€_к_руб = 69
100 * курс€_к_руб

first * курс€_к_руб
let iPhoneВ€ = 739
let iPhoneВРуб = iPhoneВ€ * курс€_к_руб

let целое: Int = 10
let дробное: Double = 10.0

целое / 3
let приведено = Int(дробное / 3)

//: Каждое значение в Swift имеет определенный тип, который можно указать явно. Как и во многих других языках программирования, дробный тип называется `Double`.

// Один способ
let isDouble1 = Double(56)

// Другой способ 
let isDouble2: Double = 56



let divided = isDouble1 / 10

//: ## Строки

let someString: String = "строка" + "другая"
someString

"Вычислим \(iPhoneВ€) евро = \(iPhoneВРуб) руб"


//: ## Массивы

//: Массив должен быть однородным, то есть состоять, например состоять только из целых чисел.

let someArray = [5, 7, 8]
let anotherArray = [2, 8, 9]

someArray + anotherArray

"Наш массив \(someArray)"

let numbers = [55, 23, 98, 33]

//: ## Функции 

//: Для определения функции используются ключевые слова `func` и `return`.
//: Надо знать заранее тип.

let rateUSDtoRUB = 64.74

func fromRUBtoUSD(amount: Double) -> Double {
    return amount / rateUSDtoRUB
}

//: `f(x)` - математическая нотация 

fromRUBtoUSD(Double(iPhoneВРуб))

//: x.f() - объектная нотация

[57, 31, 6, 8].sort()

someArray.sort()

//: ## Unicode и строки

["строка", "другая"].sort()

"строка"

"café".utf8.count // Вот так будет в C если смотреть размер массива char
"café".utf16.count // Вот так в Objective-C
"café".characters.count // Лучший метод в Swift


//: ## Тип Bool и сравнение

let результат = 15000 < 10000
результат

true || false
true && false
true == false

45 == 50 + 6
45 == 40 + 5

"абв" == "а" + "б" + "в"

"e" < "é"
"é" < "f"

let result = ["cafe", "caff", "café"].sort().reverse()

result
result.count

Array(numbers)
Array(result)


//: ## Оператор import

import Foundation

let π = M_PI
cos(π/3)

// Array(address.characters)[5]

// address[5]

"😎".utf16.count
NSString(string: "😎").length
"😎".characters.count


//: ## Параметры функций

let address = "https://github.com/ilyannn/iOS-Swift-Materials"

let url = NSURL(string: address)

NSURL(fileURLWithPath: "xxx")
NSURL(string: address)

// Параметр с именем y
func add(x: Double, y:Double) -> Double {
    return x + y
}

add(10, y: 20)

func add(x: Double, to y:Double, andMultiply k:Double) -> Double {
    let sum = x + y
    return sum * k
}

add(10, to: 20, andMultiply:  2)
add(5, to: 20, andMultiply:  2)
add(10, to: 30, andMultiply:  10)

// add(10, 20, 2)


func manyParameters(point x: Int, a: Int, b:Int, c: Int) -> Int {
    return a * x * x + b * x + c
}

manyParameters(point:10, a: 1, b: 2, c: 3)

//: ## map

numbers

func утроить(x: Int) -> Int {
    return x * 3
}

numbers.map(утроить)



numbers.sort().map(утроить) == numbers.map(утроить).sort()

//: ## map и reduce

numbers.reduce(0, combine: +)
numbers.reduce(1, combine: *)

numbers.sort().reduce(0, combine: +)

// Создадим функцию sum

func sum(array: [Int]) -> Int {
    return array.reduce(0, combine: +)
}

func sum(array: [Double]) -> Double {
    return array.reduce(0, combine: +)
}

func sum(array: [String]) -> String {
    return array.reduce("", combine: +)
}

sum(numbers)
sum(numbers.map(утроить)) == утроить(sum(numbers))

sum([4.5, 5.6])

sum(["one", "two", "three"])

//: ## filter


func good(number: Int) -> Bool {
    return number > 50
}

numbers
numbers.filter(good)

numbers.sort().filter(good) == numbers.filter(good).sort()


//: ## nil, if/let, guard/let/else

func браузер(input: String) -> String {
    let url = NSURL(string: input)
    let host = url?.host
    return "Вы пытаетесь попасть на сервер \(host)"
}

браузер("http://google.com")
браузер("*^&$&*^%*&&")

браузер("http://moscoding.ru/xxx")

func браузер_iflet(input: String) -> String {
    if let url = NSURL(string: input) {
        if let host = url.host {
            return "Вы пытаетесь попасть на сервер \(host)"
        }
    }
    return "Вы вводите фигню"
}

браузер_iflet("http://google.com")
браузер_iflet("*^&$&*^%*&&")
браузер_iflet("http://moscoding.ru/xxx")

func браузер_guardlet(input: String) -> String {
    guard let url = NSURL(string: input) else {
        return "Вы вводите строку которую нельзя преобразовать в URL"
    }
    
    guard let host = url.host else {
        return "Тут нет host!"
    }

    guard let path = url.path else {
        return "Тут нет path!"
    }

    guard path != "" else {
        return "Пустой путь!"
    }
    
    return "Вы пытаетесь посмотреть \(path) на сервере \(host)"
}

браузер_guardlet("http://google.com")
браузер_guardlet("*^&$&*^%*&&")
браузер_guardlet("http://moscoding.ru/xxx")


func браузер_optional_param(input: String) -> String {
    let url = NSURL(string: input)
    return отобразить_url(url)
}

func отобразить_url(url: NSURL?) -> String {
    
    guard let host = url?.host else {
        return "Тут нет host!"
    }

    guard let path = url?.path else {
        return "Тут нет path!"
    }
    
    guard path != "" else {
        return "Пустой путь!"
    }
    
    return "Вы пытаетесь посмотреть \(path) на сервере \(host)"
}


numbers

let numbers_copy = numbers
numbers_copy[1]

//: ## Objective-C bridging

let mutableArray = NSMutableArray()
let sameMutableArray = mutableArray

mutableArray.addObject(10)
mutableArray.addObject("строка")
sameMutableArray.addObject(20)
mutableArray


//: Изменяемые массивы 

var swiftArray: [NSObject] = []
swiftArray.append(10)
swiftArray.append("строка")

var anotherSwiftArray = swiftArray

swiftArray.append(100)
anotherSwiftArray.append(200)

swiftArray
anotherSwiftArray




//: *Если вы видите слева от этой надписи символы слэша и двоеточия, то можно выбрать в меню Editor -> Show Rendered Markup и увидеть красивый текст.*

5 + 3
67 - 89
567 * 6586


//: *Вы можете перейти на другую страницу в playground, выбрав ее слева в навигаторе. Если навигатора не видно, нажмите `cmd + 1`, а для скрытия `cmd + 0`*

//: ## Калькулятор
//: Мы можем использовать playground как интерактивный калькулятор.

5 + 6

1.2 + 1.1

(4+5)-2

65.5 * 99



5 * 5

let a = 5
let b = 5.0






//: Целые и дробные числа компилятор воспринимает по-разному.

33

33.0

//: Для целых чисел применяется целочисленное деление.

33 / 2

33.0 / 2

let результат = 57 / 5
результат

результат + результат

Double(результат) + 1.0

//: Команда `let` устанавливает связь между именем и значением.
//: Имя можно писать в любом алфавите, но есть баги – Xcode не всегда покажет подсказку.


let price_€ = 199.99 // Alt + Shift + 2 ⌥⇧2

let €к₽ = 65.5
let стоимость_в_₽ = price_€ * €к₽


//: ## Типы в Swift
//: Массивы определяются с помощью квадратных скобок.


let числа = [56, 78, 56] + [5, 6, 7]

//: При определении массива Swift догадывается, что 7 надо воспринять как дробное число.

[6.5, 5.1, 7] + [10.5]


//: У массивов есть своя операция сложения (но нет умножения, вычитания или деления!)
let backpack1 = [56, 22, 31]
let backpack2 = [40]

let numbers:[Int] = backpack1 + backpack2
numbers


//: ## Типы
//: Каждое значение в Swift имеет определенный тип, который можн указать явно. Как и во многих других языках программирования, дробный тип называется `Double`.

let Целый: Int = 33
let Дробный: Double = 33.5

//: Массив должен быть однородным
let Массив_целых: [Double] = [3, 2, 3]
let Массив_дробных: [Double] = [Дробный, 2, Дробный]



//: ## Функции
//: Для определения функции используются ключевые слова `func` и `return`.
//: Надо знать заранее тип.
let x = 5.7
x * 2

func doubleThis(x: Double) -> Double {
    return x*2
}

doubleThis(55) - 40


func удвоить(число: Int) -> Int {
    return число * 2
}

func квадрат(number: Int) -> Int {
    return number * number
}

func квадрат(number: Double) -> Double {
    return number * number
}

func утроить(число: Int) -> Int {
    return число * 3
}

удвоить(40)

квадрат(100) + удвоить(44)

func квадратПлюсТри(x: Int) -> Int {
    let квадрат = x * x
    return квадрат + 3
}

// (x + 5)^2 - 10 * x - 25

func expression(x: Int) -> Int {
    let plus5 = x + 5
    let squared = квадрат(plus5)
    return squared - 10 * x - 25
}

expression(10)
expression(25)
expression(1)
expression(-1)


// a * x^2 + b * x + c
func manyParameters(x: Int, a: Int, b:Int, c: Int) -> Int {
    return a * x * x + b * x + c
}

manyParameters(10, a: 1, b: 2, c: 3)

func manyParameters(point x: Int, a: Int, b:Int, c: Int) -> Int {
    return a * x * x + b * x + c
}

func computeNumber(x: Int, plus y: Int) -> Int {
    return x + y
}

func computeNumber(x: Int, minus y: Int) -> Int {
    return x - y
}

computeNumber(10, plus: 5)
computeNumber(10, minus: 5)

// manyParameters(10, 1, 2, 3)


// Взять точку x, умножить на k и добавить c

func scale(factor k:Double = 1, const:Double = 0, x: Double) -> Double {
    return k * x + const
}

func scaleNoNames(k:Double, _ c:Double, _ x: Double) -> Double {
    return k * x + c
}

func scaleByFactor(k:Double, const:Double, x: Double) -> Double {
    return k * x + const
}

scaleByFactor(5, const: 10.0, x: 5)

scale(factor: 3, const: 10, x: 5)
scale(factor: 10, const: 3, x: 5)

scaleNoNames(2, 5.5, 10)

scaleNoNames(1, 2, 3)

scale(factor: 1.0, const: 0.0, x: 10.5)

scale(factor: 2, x: 10)


// smalltalk
// [drive to: school in: my_car speed:60km/h]
//: Можно применять функции: математическая нотация f(x)
утроить(56)
удвоить(10)
квадрат(15)

квадрат(удвоить(2)) + удвоить(100)


//: Можно определить функцию с тем же именем, но другими типами – компилятор сам догадается, какую из них вызывать.

func удвоить(число: Double) -> Double {
    return число * 2
}


//: ## Оператор import
//: Оператор `import` делается только один раз. `Foundation` – базовые вещи, которые нужны в каждом приложении OSX или iOS.

import Foundation

//: Как дополнительный бонус, после импорта компилятор начинает понимать, что число и строка могут оба быть приведены к типу `NSObject`.

let общий:[NSObject] = [4, 5, "строка"]

let объект: NSObject = 5

let π = M_PI

pow(1675, 2.0)
cos(π)

cos(π/10)
sin(π/10)

//: Давайте поиграем с тригонометрическими функциями. В `Foundation` значение π называется так:

cos(M_PI)

//: Но можно опрелить свое имя. π вводится alt + P (в американской раскладке)

//: Напомним про тригонометрические функции. Заметим, что математически cos(π/3) точно равен 0.5, но компилятор честно считает – и имеет неточность в последнем знаке.

sin(π/3)
cos(π/3)

//: ## Объектная нотации
//: Функция – это глагол в S-V-O. В большинстве индоевропейских языков сначала идет субъект, потом глагол. Вообще в мире так говорит большее число людей чем с другими порядками.
// let numbers = [45, 345, 67]

numbers
numbers.sort()
numbers.sort()
numbers
//: В C++ 17 сейчас тоже будет чаще применяться объектная нотация.
//: Для интересующихся – [статья Bjarne Stroustrup на ту тему](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2014/n4174.pdf).

numbers.sort()
numbers

let sorted = numbers.sort()


numbers.minElement()
numbers.maxElement()

numbers.sort().maxElement()

numbers.last

numbers.sort().sort().sort().reverse().sort()

let numbersSorted = numbers.sort()
let numbersSortedTwice = numbersSorted.sort()
let sortedAndReversed = numbersSortedTwice.reverse()
let sortedAndReversedArray = Array(sortedAndReversed)
let finalResult = sortedAndReversed.sort()


//: Примеры функций – `.maxElement()`
numbers.maxElement()

numbers.maxElement()
numbers.minElement()

numbers.sort().minElement()
numbers.sort().first

numbers[0]
numbers.first

let reverse = numbers.reverse()
reverse.first
reverse.count
Array(reverse)

Array(numbers.sort().reverse())


//: На самом деле `first` это тоже функция, но определенная без скобок. Почему и как – мы узнаем потом.
numbers.first
numbers.minElement()

2.2354765900.description

//: ## Использование `map`

[4, 5, 6]

numbers

numbers[0]
numbers[1]
numbers[2]
numbers[3]


numbers.map(квадрат)

numbers.map(квадрат).map(удвоить)


numbers.map(удвоить).map(утроить)[1]

numbers.map(удвоить).map(квадрат)

//: Извлечение квадратного корня – всегда называют sqrt ("square root")
func sqrt(x: Int) -> Double {
    return pow(Double(x), 0.5)
}

let roots = numbers.map(sqrt)

roots.map(квадрат)



0...5
Array(0..<4)
//: Есть операторы интервала (range) ..<  и ... Например, интервал `0...2` это три числа 0, 1, 2, а  `0..<2` это два числа `0, 1`
numbers[1]


numbers[0...2]


numbers[0..<2] + numbers[3...3]



//: Как определить новый массив из элементов старого.

let новый1 = 77
let новый_numbers = [новый1] + numbers[1...3]

// массив из numbers без индекса 1: [56, 31, 40]
let numbers1 = numbers[0...0]

let numbers2 = Array(numbers[1...3])
numbers1 + numbers2

//: Пример: сложение массивов

func addElements(of left: [Int], to right:[Int]) -> [Int] {
    
    func result(index:Int) -> Int {
        return left[index] + right[index]
    }
    
    let length = min(left.count, right.count)
    
    return (0..<length).map(result)
}

addElements(of: numbers, to: [20, 30, 40])

let length = 2

Array(0..<length)


//: ## Нечисловые типы
//: Значения `true` и `false` – результаты выражений типа ` A == B`

numbers1 + numbers2 == [56, 31, 40]

5 == 6
7 == 7
4 * 2 + 2 == 4

false
true

numbers.isEmpty

let empty_ints:[Int] = []
empty_ints.count
empty_ints.isEmpty

//: Есть функции, которые возвращают значения `true` или `false`.
func missionAccomplished(remainingTasks: [Int], success: Bool) -> Bool {
    return remainingTasks.isEmpty && success
}

missionAccomplished([1], success: true)
missionAccomplished([], success: false)
missionAccomplished([], success: true)

//: Еще с ними можно производить разные логические операции.
false != true

true == true
false == false
true == false

// Булева алгебра 

//: Операции and и or (в математике и языке Python)

true && false
true || false
true == false

5 == 6

//: Кстати, компилятор позволяет нам определить любое имя в пределах правил, даже похожее на другие имена.

let trüe = false
trüe

let False = true

//: Вместе `true` и `false` называются тип `Bool`.
let правда:Bool = 5 * 5 == 25
let ложь:Bool = numbers.contains(1)

let мнения: [Bool] = [true, false]

//: Приведения типа друг в друга
Double(4) / Double(3)
4 / 3

Bool(0)
Int(false)
Int(true)

//: Строки определяются с помощью символа `"`
"Строка"

let string1 = "Много"
let string2 = "Букв"

let string = string1 + string2

Array(string1.characters) + Array(string2.characters)

let пробел = " "

пробел != ""

"".characters.count
пробел.characters.count

//: Можно определять объекты как в Java: `Тип(параметры)`
//: Например, String() это пустая строка

String()
String(5.765754)

NSNumberFormatter().numberFromString("237.6")

"" == String()

//: Можно вставить в строку что-то, даже если это что-то является выражением.
let endOfLine = "\n"

"В массиве \( numbers ) есть \( numbers.count ) элемента" + endOfLine + "Другая строка"

"Массив \(numbers.map(квадрат)) круто"
"..."
//: Но также есть строки формата, знакомые из (Objective-)C

//: ## Использование reduce

//: Чтобы преобразовать массив в какое-то значение.

numbers

//: Как получить сумму?
56 + 22 + 31 + 40

numbers.reduce(1, combine: *)

//: `reduce` начинает с начального значения (например, 0) и применяет операцию (например, +)
numbers.reduce(1, combine: *) == 56 * 22 * 31 * 40




numbers.reduce(0, combine: +)

numbers.reduce(1, combine: *)

//: Резюме:
//: * Массив -> массив: `map`
//: * Массив -> значение: `reduce`

//: ## filter

// 55 по модулю 2
56 % 2

// 55 по модулю 3
56 % 3


// Написать функцию определения того, что число нечетное

func isEven(x: Int) -> Bool {
    return x % 2 == 0 // <- четное
}

isEven(10)

// Определение с помощью оператора "противоположно" в Булевой алгебре

func isOdd(x: Int) -> Bool {
    //    return x % 2 != 0 // <- нечетное
    return !isEven(x)
}

numbers.filter(isEven)
numbers.filter(isOdd)


func iLike(x:Int) -> Bool {
    return x > 20 && x < 50
}

numbers.filter(iLike)

//: [Следующая страница: Поисковик](@next)

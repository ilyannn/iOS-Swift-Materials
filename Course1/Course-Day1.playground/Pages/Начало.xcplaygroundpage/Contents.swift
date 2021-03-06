//: *Если вы видите слева от этой надписи символы слэша и двоеточия, то можно выбрать в меню Editor -> Show Rendered Markup и увидеть красивый текст.* 

//: *Вы можете перейти на другую страницу в playground, выбрав ее слева в навигаторе. Если навигатора не видно, нажмите `cmd + 1`, а для скрытия `cmd + 0`* 

//: ## Калькулятор
//: Мы можем использовать playground как интерактивный калькулятор.

5 + 6

1.2 + 1.1

(4+5)-2

65.5 * 99



//: Целые и дробные числа компилятор воспринимает по-разному.

33

33.0

//: Для целых чисел применяется целочисленоое деление.

33 / 2

33.0 / 2

//: Команда `let` устанавливает связь между именем и значением.
//: Имя можно писать в любом алфавите, но есть баги – Xcode не всегда покажет подсказку.

let стоимость€ = 499.99 // Alt + Shift + 2 ⌥⇧2 
let курс_€к₽ = 65.5
let стоимость_в_₽ = стоимость€ * курс_€к₽


//: ## Типы в Swift
//: Массивы определяются с помощью квадратных скобок.

[5, 6, 7]

//: При определении массива Swift догадывается, что 7 надо воспринять как дробное число.

[6.5, 5.1, 7] + [10.5]

//: У массивов есть своя операция сложения (но нет умножения, вычитания или деления!)

let numbers = [56, 22, 31] + [40]


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

func удвоить(число: Int) -> Int {
    return число * 2
}

func квадрат(number: Int) -> Int {
    return number * number
}

//: Можно применять функции: математическая нотация f(x) 
удвоить(10)
квадрат(15)

квадрат(удвоить(2)) + удвоить(100)


//: Можно определить функцию с тем же именем, но другими типами – компилятор сам догадается, какую из них вызывать.

func удвоить(число: Double) -> Double {
    return число * 2
}

func удвоить(число: [Int]) -> Int {
    return 10
}

[1, 3, 5]

удвоить([1])

//: **Вопрос:** как сделать в Swift так, чтобы в массиве были одновременно строки и числа. 
//: Один из способов – определить новый тип "Строка или Число". Не во всех языках есть такой тип!

enum Тип {
    case Число(число: Int)
    case Строка(строка: String)
}

let общий_swift: [Тип] = [Тип.Число(число: 4), Тип.Число(число: 5), Тип.Строка(строка: "строка")]

//: ## Оператор import
//: Оператор `import` делается только один раз. `Foundation` – базовые вещи, которые нужны в каждом приложении OSX или iOS.

import Foundation

//: Как дополнительный бонус, после импорта компилятор начинает понимать, что число и строка могут оба быть приведены к типу `NSObject`.

let общий:[NSObject] = [4, 5, "строка"]

//: Давайте поиграем с тригонометрическими функциями. В `Foundation` значение π называется так:

cos(M_PI)

//: Но можно опрелить свое имя. π вводится alt + P (в американской раскладке)

let π = M_PI 

//: Напомним про тригонометрические функции. Заметим, что математически cos(π/3) точно равен 0.5, но компилятор честно считает – и имеет неточность в последнем знаке.

sin(π/3)
cos(π/3)


//: Как повернуть вектор (10, 0) влево на π/4:

let новый_х = 10 * cos(π / 4)
let новый_y = 10 * sin(π / 4)

//: Длина вектора остается той же самой. Если бы это можно было нарисовать...

let Длина_вектора = sqrt(новый_х * новый_х + новый_y * новый_y)

//: ## Объектная нотации
//: Функция – это глагол в S-V-O. В большинстве индоевропейских языков сначала идет субъект, потом глагол. Вообще в мире так говорит большее число людей чем с другими порядками.

//: В C++ 17 сейчас тоже будет чаще применяться объектная нотация.
//: Для интересующихся – [статья Bjarne Stroustrup на ту тему](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2014/n4174.pdf).

numbers.sort()

let sorted = numbers.sort()

//: Примеры функций – `.maxElement()`
numbers.maxElement()
numbers.minElement()

numbers.sort().minElement()
Array(numbers.sort().reverse())

//: На самом деле `first` это тоже функция, но определенная без скобок. Почему и как – мы узнаем потом. 
numbers.first
numbers.minElement()


//: ## Использование `map`

[4, 5, 6]

numbers

numbers.map(удвоить)

numbers.map(удвоить).map(квадрат)


func остатокПоМодулю3(число: Int) -> Int {
    return число % 3 // 0, 1 или 2
}

numbers.map(остатокПоМодулю3)

//: Есть операторы интервала (range) ..<  и ... Например, интервал `0...2` это три числа 0, 1, 2, а  `0..<2` это два числа `0, 1`

numbers[0...2] 
numbers[0..<2]  

//: Как определить новый массив из элементов старого.

let новый1 = 77
let новый_numbers = [новый1] + numbers[1...3]

//: ## Нечисловые типы
//: Значения `true` и `false` – результаты выражений типа ` A == B`

5 == 6
7 == 7
2 + 2 == 4

false
true

//: Есть функции, которые возвращают значения `true` или `false`.
numbers.isEmpty

//: Еще с ними можно производить разные логические операции.

true == true
false == false
true == false

true && false
true || false
true == false

5 == 6

//: Кстати, компилятор позволяет нам определить любое имя в пределах правил, даже похожее на другие имена.

let trüe = false
trüe

//: Вместе `true` и `false` называются тип `Bool`.
let правда:Bool = 5 * 5 == 25
let ложь:Bool = numbers.contains(1)

let мнения: [Bool] = [true, false]
Bool(0)

//: Строки определяются с помощью символа `"`

"Много" + "Букв"
let пробел = " " 

//: Можно определять объекты как в Java: `Тип(параметры)`
//: Например, String() это пустая строка

пробел != String() 

//: Можно вставить в строку что-то, даже если это что-то является выражением.

"Массив \(numbers.map(квадрат)) круто"

//: Но также есть строки формата, знакомые из (Objective-)C
String(format: "Вывод %05d с нулями!", 30)



//: ## Использование reduce

//: Чтобы преобразовать массив в какое-то значение.

numbers

//: Как получить сумму?
56 + 22 + 31 + 40

//: `reduce` начинает с начального значения (например, 0) и применяет операцию (например, +)

numbers.reduce(0, combine: +)

numbers.reduce(1, combine: *)

//: Резюме: 
//: * Массив -> массив: `map`
//: * Массив -> значение: `reduce`


//: [Следующая страница (Решето)](@next)

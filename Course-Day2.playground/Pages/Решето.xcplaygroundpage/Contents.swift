//: [Предыдущая страница (Начало)](@previous)

//: ## [Решето Эратосфена](https://ru.wikipedia.org/wiki/Решето_Эратосфена)

//: Оператор `%` это математическая операция взятия по модулю.
func не_делится_на_2(number: Int) -> Bool {
    return number % 2 != 0
}

//: Примеры: некоторые числа делятся на 2, а некоторые нет.
не_делится_на_2(0)
не_делится_на_2(1)
не_делится_на_2(2)
не_делится_на_2(3)

//: Функции также можно определить оператором `let`.
//: При этом тип функции определяется с помощью стрелки `->`, а значение функции с помощью фигурных скобок.

let не_делится_на_3: Int -> Bool = { number in
    return number % 3 != 0
}

//: Попробуем применить эти функции как фильтр. 

//: *Напоминаем, что просмотреть большой массив можно нажав на знак `+`, который появится если навести мышку на значение справа.*

(1..<100).filter(не_делится_на_2).filter(не_делится_на_3)


//: Короткая форма описания функции: имя аргумента можно опустить, как и круглые скобки вокруг фигурных.

(1...100).filter(не_делится_на_2).filter(не_делится_на_3).filter({ number in 
    return number % 5 != 0
}).filter { $0 % 7 != 0 }


//: Вместо того, чтобы определять отдельно функцию для 2 и для 3, давайте сделаем универсальное определение. В данном случае мы сделали функцию, которая возвращает функцию!

func не_делится(на число:Int) -> (Int -> Bool) {

//: У нас есть возможность использовать или полную форму определения функции или короткую.
    
    //    func результат(тестируемый: Int) -> Bool {
    //        return тестируемый % число != 0
    //    }
    //    
    //    return результат
    
    return { $0 % число != 0 }
}

//: Работает вот так:

не_делится(на: 5)(500)
не_делится(на: 10)(500)
не_делится(на: 55)(500)

//: Попробуем просеять числа с помощью фильтров для 2, 3, 5 и 7. Получатся простые, по крайней мере до 121.

let простые_от_11_до_120 = (2..<120).filter(не_делится(на: 3)).filter(не_делится(на: 5)).filter(не_делится(на: 7)).filter(не_делится(на: 2))

//: Англоязычные имена вызывают у Xcode меньше багов.
let hasRemainder = не_делится

//(2...100).filter(hasRemainder(на: 2)).filter(hasRemainder(на: 3)).filter(hasRemainder(на: 5))

//: Наша следующая задача – написать функцию просеивания массива.


func просеять(массив: [Int]) -> [Int] {
//    guard let первое = массив.first else { return [] } // if-else
//    let часть = просеять(массив.filter(не_делится(на: первое)))

//    if let первое = массив.first {
//        let часть = просеять(массив.filter(не_делится(на: первое)))
//        return [первое] + часть
//    } else { 
//        return [] 
//    }

    switch массив.first {
    
    case .None: 
        return []

    case .Some(let первое): 
        let часть = просеять(массив.filter(не_делится(на: первое)))
        return [первое] + часть
        
    }
}


//просеять(Array(2...1000)).maxElement()

func делится(на число:Int) -> (Int -> Bool) {
    return { $0 % число == 0 }
}


//: Template (C++), Generic functions (C#, Swift)

func +<T>(a: (T -> Bool), b:(T -> Bool)) -> (T -> Bool) {
    func ab(x: T) -> Bool {
        let результатA = a(x)
        let результатB = b(x)
        return результатA && результатB
    }
    return ab
}


//let результат10 = (1...200).filter(делится(на: 2) + делится(на:5)) 
//результат10
//
//результат10    == (1...200).filter(делится(на: 10))

let триФильтра = делится(на: 2) + делится(на:5) + делится(на:7)

let набор = [2, 3, 7, 11]

let набор_фильтр = набор.map(делится).reduce({ _ in true }, combine: +)

[0, 15, 2*3*7*11 * 20, 100, 345, 345943509].filter(набор_фильтр)


//: [Next](@next)



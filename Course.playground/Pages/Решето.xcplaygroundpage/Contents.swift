//: [Previous](@previous)

import Foundation

//: ## [Решето Эратосфена](https://ru.wikipedia.org/wiki/Решето_Эратосфена)

func не_делится_на_2(number: Int) -> Bool {
    return number % 2 != 0
}

let не_делится_на_3: Int -> Bool = { number in
    return number % 3 != 0
}

не_делится_на_2(0)
не_делится_на_2(1)
не_делится_на_2(2)
не_делится_на_2(3)

// Короткая форма описания функции.

//: Короткая форма описания функции.
(1...100).filter(не_делится_на_2).filter(не_делится_на_3).filter({ number in 
    return number % 5 != 0
}).filter { $0 % 7 != 0 }


(1..<100).filter(не_делится_на_2).filter(не_делится_на_3)

func не_делится(на число:Int) -> (Int -> Bool) {
    
//    func результат(тестируемый: Int) -> Bool {
//        return тестируемый % число != 0
//    }
//    
//    return результат
    
    return { $0 % число != 0 }
}

не_делится(на: 5)(500)
не_делится(на: 10)(500)
не_делится(на: 55)(500)


func делится(на число:Int) -> (Int -> Bool) {
    return {$0 % число == 0}
}

func предикатИз<T>(предикаты:[T -> Bool]) -> (T -> Bool) {
    return {объект in !lazy(предикаты).map{f in f(объект)}.contains(false) }
}

let простые_от_11_до_120 = (2..<120).filter(не_делится(на: 3)).filter(не_делится(на: 5)).filter(не_делится(на: 7)).filter(не_делится(на: 2))

import Swift

let hasRemainder = не_делится

(2...100).filter(hasRemainder(на: 2)).filter(hasRemainder(на: 3)).filter(hasRemainder(на: 5))

//func просеять(массив: [Int]) -> [Int] {
//    
//}

func просеять(числа: [Int]) -> [Int] {
//    guard let первое = числа.first else { return [] }
//    return [первое] + просеять(числа.filter(не_делится(на: первое)))
    
//    if let первое = числа.first {
//    	return [первое] + просеять(числа.filter(не_делится(на: первое)))
//    } else { return [] }
    
    switch числа.first {
    case .None: return []
    case .Some(let первое): return [первое] + просеять(числа.filter(не_делится(на: первое)))
    }
}

func Простые(до число: Int) -> [Int] {
    return просеять(Array(2...число))
}

Простые(до: 4)
Простые(до: 10)
Простые(до: 50)
//Простые(до: 1000)

(1...200).filter(предикатИз([2, 3].map(делится) + [5, 8].map(не_делится)))

(1...200).filter(предикатИз([2, 3].map(делится))) == (1...200).filter(делится(на: 6))

(1...200).filter(предикатИз([2, 3].map(не_делится))) != (1...200).filter(не_делится(на: 6))

//: [Next](@next)

//: [Previous](@previous)

import Foundation

//: ## [Решето Эратосфена](https://ru.wikipedia.org/wiki/Решето_Эратосфена)

func не_делится_на_2(number: Int) -> Bool {
    return number % 2 != 0
}

func не_делится_на_3(number: Int) -> Bool {
    return number % 3 != 0
}

(1..<100).filter(не_делится_на_2).filter(не_делится_на_3).filter {
    return $0 % 5 != 0
}

func не_делится(на число:Int) -> (Int -> Bool) {
    return {$0 % число != 0}
}

func делится(на число:Int) -> (Int -> Bool) {
    return {$0 % число == 0}
}

func предикатИз<T>(предикаты:[T -> Bool]) -> (T -> Bool) {
    return {объект in !lazy(предикаты).map{f in f(объект)}.contains(false) }
}

let простые = (1..<120).filter(не_делится(на: 3)).filter(не_делится(на: 5)).filter(не_делится(на: 7)).filter(не_делится(на: 2))

func корень_сверху(число: Int) -> Int {
    precondition(число > 0)
    
//    return (0...число)
//        .map{ ($0, ($0 + 1) * ($0 + 1)) }
//        .filter { $1 > число } 
//        .first!
//        .0

    return Int(sqrt(Double(число))) + 1
}

(1...11).map(корень_сверху)

func Простые(до число: Int) -> [Int] {
    switch число {
    case 1: return []
    case 2: return [2]
//    case 3, 4: return [2, 3]
//    case 5, 6: return [2, 3, 5]
//    case 7...10: return [2, 3, 5, 7]
    default:
        let корень    = корень_сверху(число)
        let маленькие = Простые(до: корень)
//        let решето    = предикатИз(маленькие.map(не_делится))
//        let большие   = (корень...число).filter(решето)
        let большие   = (корень...число).filter { кандидат in
            return !маленькие.contains { 
                делитель in кандидат % делитель == 0
            }          
        }
        return маленькие + большие
    }
}

Простые(до: 4)
Простые(до: 10)
Простые(до: 50)
Простые(до: 1000)

(1...200).filter(предикатИз([2, 3].map(делится) + [5, 8].map(не_делится)))

(1...200).filter(предикатИз([2, 3].map(делится))) == (1...200).filter(делится(на: 6))

(1...200).filter(предикатИз([2, 3].map(не_делится))) != (1...200).filter(не_делится(на: 6))

//: [Next](@next)

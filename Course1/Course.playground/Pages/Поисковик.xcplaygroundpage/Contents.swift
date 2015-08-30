//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

let names = ["Илья", "Петя", "Вова", "Олег", "Павел", "Василиса", "Дарья"]

//: Строки можно вставлять друг в друга
func привет(имя: String) -> String {
    return "Привет, \(имя)!"
}

привет("Незнакомец")
names.minElement()
names.maxElement()
names.map(привет)
names.reverse().map(привет)

//: Соединение строк в одну строку
let все = ", ".join(names)
привет(все)

//: ##  Поисковик

func ПоискП(имя:String) -> [String] {
    return имя.characters.first == "П" ? [имя] : []
}

names.map(ПоискП).reduce([], combine: +)

func ПоискИ(имя:String) -> [String] {
    return имя.characters.first == "И" ? [имя] : []
}

names.map(ПоискИ).reduce([], combine: +)

names.map {имя in 
    return имя.characters.first == "П" ? [имя] : []
    }.reduce([], combine: +)

func Найди<T>(функция: String -> [T]) -> [T] {
    return names.map(функция).reduce([], combine: +)
}

func Найди(букву искомая: Character) -> [(String, Int)] {
    let функция: String -> [(String, Int)] = { строка in 
        строка
            .lowercaseString
            .characters
            .enumerate()
            .filter { номер, буква in 
            	буква == искомая
        	}.map { номер, буква in 
            	(строка, номер)
        	}
    }
    return Найди(функция)
}

Найди(букву: "о")
Найди(букву: "и")

names.filter { имя in 
    имя.characters.count > 4 
}.map(привет)


//: ##  Оператор switch

names.last
[String]().last
[1, 3, 5].last

func и(части:[String]) -> String {
    return " ".join(части.enumerate().map({ номер, часть in
        switch части.count - номер {
        case 1:  return часть
        case 2:  return часть + " и"
    	default: return часть + ","
        }
    }))
}

и([]) == ""
и(["А"]) == "А"
и(["А", "Б"]) == "А и Б" 
и(["А", "Б", "В"]) == "А, Б и В"
и(["А", "Б", "В", "Г"]) == "А, Б, В и Г"

привет(и(names.filter { имя in 
    имя.hasSuffix("я") 
}))


//: [Next](@next)



//: [Previous](@previous)

let names = ["Вася", "Илья", "Петя Ш", "Катя" ]

func ЭтоВ(name: String) -> Bool {
    return name.characters.first == "В"
}

func ЭтоП(name: String) -> Bool {
    return name.characters.first == "П"
}

func ЭтоШ(name: String) -> Bool {
    return name.characters.first == "Ш"
}

names.filter(ЭтоВ)

//: Это пример типа функций

let f: String -> Bool = ЭтоШ


func Это(search:Character) -> (String -> Bool) {
    
    func f(name: String) -> Bool {
        return name.characters.first == search
    }
    
    return f
}

names.filter(Это("В"))

func ЭтоСоСравнением(test:Character? -> Bool) -> (String -> Bool) {
    
    func f(name: String) -> Bool {
        return test(name.characters.first)
    }
    
    return f
}

names.filter(ЭтоСоСравнением({ char in
    char == "В" || char == "П"
}))

//: Написать поисковик, который изет по всем текстам какую-то букву

names.filter(Это("В"))

Array("Строка".characters.enumerate())

// Весь алгоритм поиска
func Поиск(search: Character) -> [(Int, String)] {
    return names.map{ name in
        
        return name
            .characters
            .enumerate()
            .filter {
                $1 == search
            }.map{
                ($0.0, name)
            }
        
    }.reduce([], combine: +)
}

func Поиск(test: Character? -> Bool) -> [(Int, String)] {
    return names.map{ name in
        
        return name
            .characters
            .enumerate()
            .filter {
                test($1)
            }.map{
                ($0.0, name)
        }
        
        }.reduce([], combine: +)
}

Поиск("т")

//: Самая короткая форма функции:

names.map {
    "Привет, \( $0 )!"
}.joinWithSeparator("\n")

//: Примеры наборов

let pair: (Int, String, Int) = (5, "Строка", 8)

//: [Next](@next)

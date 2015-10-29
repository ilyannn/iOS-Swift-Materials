//: [Previous](@previous)

//: *Напоминаем, что просмотреть большой массив можно нажав на знак `+`, который появится если навести мышку на значение справа.*



let names = ["Вася", "Илья Н", "Петя Ш", "Катя", "Илья Е", "Наталья", "Женя", "Доротья", "Марфия", "Япоша" ]

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


func КонецЯ(name: String) -> Bool {
    return name.characters.last == "я"
}

names.filter(КонецЯ)


func Конец(конец: Character) -> (String -> Bool) {
    
    func f(name:String) -> Bool {
        return name.characters.last == конец
    }
    
    return f
}


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

//: Короткая форма описания функции: имя аргумента можно опустить, как и круглые скобки вокруг фигурных.
func тестер(char:Character?) -> Bool {
    return char == "В" || char == "П"
}

names.filter(ЭтоСоСравнением(тестер))

names.filter(ЭтоСоСравнением({ char in
    char == "В" || char == "П"
}))

//: Написать поисковик, который ищет по всем текстам какую-то букву

names

func search_factory(чемто: Character) -> String -> [(Int, Character, String)] {
    
    return { name in
    
        return name
                .lowercaseString
                .characters
                .enumerate()
                
                .map {
                    ($0, $1, name)
                }
                
                .filter { (index, char, string) in
                    char == чемто
        }
    }

}

names
    .map(search_factory("ф"))
    .reduce([], combine:+)
    .map { index, char, name in
        "Привет, \( name )!"
    }
    .joinWithSeparator("\n")


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

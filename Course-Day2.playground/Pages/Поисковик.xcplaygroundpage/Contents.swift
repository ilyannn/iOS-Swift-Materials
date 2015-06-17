//: [Previous](@previous)
let names = ["Илья Ш", "Илья Н", "Петя", "Вова", "Олег", "Павел", "Василиса", "Дарья", "Дима", "Аркадий", "Аркадий 16"]

func привет(имя:String) -> String {
    return "Привет, \(имя)!"
}

//: Функция `join`

func привет(имена:[String]) -> String {
    let длинное = ", ".join(имена)
    return "Привет, \(длинное)!"
}

names.sort().map(привет)
привет(names)


let именаИ = names.filter { имя in имя.lowercaseString.characters.first == "и" }

именаИ

let результат: (String, Int) = ("Василиса", 2)




func Robot(искомая:Character) -> (String -> [(String, Int)]) {
    
    return { имя in
        
        return имя
            .lowercaseString 
            .characters
            .enumerate()
            .filter { индекс, буква in
                буква == искомая
            }
            .map {индекс, буква in 
                (имя, индекс) 
        }
        
    }
}

typealias RobotType = (String -> [(String, Int)])

func +(a: RobotType, b: RobotType) -> RobotType {
    func ab(x: String) -> [(String, Int)] {
        return a(x) + b(x)
    }
    return ab
}


[].join(names.map(Robot("а")))


// names.map(робот).reduce([], combine: +)

func преобразовать(имя: String, индекс:Int) -> String {
    let где = advance(имя.startIndex, индекс)
    return имя[имя.startIndex..<где] + "➜" + имя[где..<имя.endIndex]
}

func Поиск(буква: Character) -> String {
    let результат_из_скобок = [].join(names.map(Robot(буква)))
    let результат_из_строк = результат_из_скобок.map (преобразовать)
    return "\n".join(результат_из_строк) 
}

Поиск("и")





//: Playground - noun: a place where people can play

import UIKit

let names = ["Вася Петров", "Петя и Катя Ивановы", "Василий", "Илья Н"]

typealias Robot = String -> [(String, Int)]

func robot(char:Character) -> Robot {

    func search(str:String) -> [(String, Int)] {
        
        let result = str
            .lowercaseString
            .characters
            .enumerate()
            .filter { $1 == char }
            .map { (str, $0.0) }
        
        return Array(result)
    }
    
    return search
}


//Array(names.map(search).flatten())


Array([[5, 6, 8], [], [1, 2]].flatten())

class Search {
    
    let mapRobot: Robot
    
    init(char:Character) {
        mapRobot = robot(char)
    }

    func mapStep() -> [(String, Int)] {
        return names.flatMap(mapRobot)
    }
    
    func execute() -> String {
        
        let mapped = mapStep()
            .map {str, index in " → \(index) в '\(str)'"}
    
        return "Я нашла \(mapped.count):"
            + mapped.reduce(""){ $0 + "\n" + $1 }
        
    }
}

let search = Search(char: "в")
search.execute()




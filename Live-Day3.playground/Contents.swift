//: Playground - noun: a place where people can play

import UIKit




//: ## Optional 

let num: Int? = nil

let strings = ["6", "78", "dsjhf", "-7", "sdklfj"]

//: # Nil coalescing ??

let maybe_numbers:[Int?] = strings.map { str in
    (Int(str) ?? 0) + 1
}

let definitely_numbers:[Int] = strings.flatMap { str in
    Int(str)
}

// Неправильные строки заменяются на 0
func increase(version: String) -> String {
    let maybe_number = Int(version)
    let increased = (maybe_number ?? 0) + 1
    return String(increased)
}

increase("5")
increase("sdf")

//: ## Оператор guard/let/else

//: Неправильные строки возвращают nil
func maybe_increase(version: String) -> String? {
    guard let definitely_number = Int(version) else { return nil }
    
    let increased = definitely_number + 1
    return String(increased)
}

//: Неправильные строки возвращают ""
func increase_or_empty(version: String) -> String {
    guard let definitely_number = Int(version) else { return "" }
    
    let increased = definitely_number + 1
    return String(increased)
}

maybe_increase("dsjkfh")
increase_or_empty("ksjdhf")

//: Вернемся к NSURL

func result(string: String) throws -> AnyObject?  {
    guard let good_url = NSURL(string: string) else { return nil }
    guard let data = NSData(contentsOfURL: good_url) else { return nil }
    
    let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
    
    return json
}



let json = try result("https://github.com/ilyannn/iOS-Swift-Materials/raw/master/example.json")



//: ## NSString vs String

let string = "😡"
string.characters.count
Array(string.utf16)

let nsstring:NSString = "😡"
nsstring.length

nsstring.characterAtIndex(0)
nsstring.characterAtIndex(1)


let eAcute:NSString = "\u{E9}"                         // é
eAcute.length

let combinedEAcute:NSString = "\u{65}\u{301}"
combinedEAcute.length
combinedEAcute.characterAtIndex(0)
combinedEAcute.characterAtIndex(1)

eAcute.isEqualToString(combinedEAcute as String)

let eAcute_swift:String = "\u{E9}"                         // é
let combinedEAcute_swift:String = "\u{65}\u{301}"
eAcute_swift == combinedEAcute_swift
eAcute_swift.characters.count
combinedEAcute_swift.characters.count


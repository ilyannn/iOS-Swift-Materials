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

func result(string: String) -> NSString {
    guard let good_url = NSURL(string: string) else { return "" }

    guard let data = NSData(contentsOfURL: good_url) else { return "" }
    
    return NSString(data: data, encoding: NSUTF8StringEncoding) ?? ""
}

result("https://en.wikipedia.org/w/index.php?title=Elliott_Fitch_Shepard&printable=yes")


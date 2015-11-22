//: Playground - noun: a place where people can play

import UIKit

//: ## Изменяемые свойства

class DateTime {
    var year = 2015
}

class CourseList {
    var languages = ["Objective-C"]
}

let color = UIColor(red: 0.9, green: 0.1, blue: 0.3, alpha: 0.6)

if let url = NSURL(string: "https://www.google.com/search?client=safari&rls=en&q=what+is+url&ie=UTF-8&oe=UTF-8") {
    url.scheme
    url.host
    url.path
    url.query
    
    let urlComponents = NSURLComponents(URL: url, resolvingAgainstBaseURL: false)
    
    urlComponents?.path = "/"
    urlComponents?.path
}

let courseList = CourseList()
courseList.languages

let label = UILabel()
label.textColor = color
label.text = "Привет"
label.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.1)

label.text
label.textColor

//: ## Проваливание

//: Делается с помощью cmd+мышки. Можно провалиться в import, в класс, в функцию, в конкретное свойство.

//: ## Optional!


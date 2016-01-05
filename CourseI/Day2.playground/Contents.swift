//: Playground - noun: a place where people can play

import UIKit

var numbers = [1, 4, 6]
var numbers_copy = numbers
numbers_copy[0] = 10

numbers
numbers_copy

let someURL = NSURLComponents(string: "http://google.com/xxx")!

let anotherName = someURL

someURL.host
someURL.host = "wikipedia.org"
someURL.scheme = "https"

someURL.URL
anotherName.URL

class Person {
    var hungerLevel = 0
}

let ilya = Person()
let teacher = ilya

teacher.hungerLevel
ilya.hungerLevel = 50
teacher.hungerLevel


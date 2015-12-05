//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let url = NSURL(string: "http://google.com")

if var url = url {
    url.absoluteURL
    url = NSURL(fileURLWithPath: "xxx")
}

var number = 5

number -= 1
number += 1

let numbers = [4, 7, 8]

// for (index = 0; index < numbers.count; index++) <-- в C

for (index, element) in numbers.enumerate() {
    index
    element
}


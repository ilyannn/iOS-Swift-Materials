//: Playground - noun: a place where people can play

import Foundation

//: ## Операции 

var stuff = 0

let queue1 = NSOperationQueue()
let queue2 = NSOperationQueue()

queue1.qualityOfService = .Default
queue2.qualityOfService = .Background

queue1.addOperationWithBlock {
    sleep(1)
    stuff = 10
}

queue2.addOperationWithBlock {
    sleep(1)
    stuff = 11
}

queue1.waitUntilAllOperationsAreFinished()

stuff

//: ## Строки и ленивые вычисления

let string = "Hello world"

var string1 = string
var string2 = string

string1 += "!"
string2 += "?"

string.characters.count

let 😎 = "😎"

Array(😎.characters)
Array(😎.utf16)

(😎 as NSString).length

Array(😎.utf8)

😎 + 😎 + 😎


Array(string.characters.reverse().reverse())

//: ## Массивы и функциональный стиль программирования

import UIKit

let numbers = [15, 2, 76, 55]

let colors = [UIColor.redColor(), UIColor.blueColor(), UIColor.greenColor()]

func удвоить(x: Int) -> Int {
    return x * 2
}

func negate(x: Int) -> Int {
    return -x
}

let formatter = NSNumberFormatter()
formatter.numberStyle = .SpellOutStyle

func describe(x:Int) -> String? {
    return formatter.stringFromNumber(x)
}

numbers.map(удвоить).map(negate)
numbers.map(negate).map(удвоить).map(describe)

(numbers as [NSNumber]).flatMap(formatter.stringFromNumber)


//: ## Булевская алгебра

let integer = 5

true
false

integer + 1
integer * 2

let bool_example:Bool = integer < 3

func хорошее(x: Int) -> Bool {
    return (x < 0) || (x > 10)
}

func четные(x: Int) -> Bool {
    return x % 2 == 0
}

func по_модулю2(x: Int) -> Int {
    return x % 2
}

Array(1...10).map(по_модулю2)

Bool(0)
Bool(100)
Int(true)
Int(false)

хорошее(5)
хорошее(15)

//: ## filter

numbers
numbers.filter(хорошее).filter(четные)

func делится_на_7(x: Int) -> Bool {
    return x % 7 == 0
}

func делится_на_6(x: Int) -> Bool {
    return x % 6 == 0
}

let test = [6, 7, 8, 14, 20, 21]

test.filter(делится_на_7).map(удвоить)
test.map(удвоить).filter(делится_на_7)

test.filter(делится_на_6).map(удвоить)
test.map(удвоить).filter(делится_на_6)


test.reduce(0, combine: +)
test.reduce(1, combine: *)

let names = ["Илья", "Вася", "Петя"]

func с_пробелом(x: String, y: String) -> String {
    
    guard x != "" else { return y }
    return x + ", " + y
}

func greet(names: [String]) -> String {
    return "Привет: " + names.reduce("", combine: с_пробелом)
}

greet(names + names + names)



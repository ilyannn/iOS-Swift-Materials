//: Playground - noun: a place where people can play

//: ## Строки 

let str = "ccc"
let rate = 80.03

//: ## Библиотеки

import Foundation
NSURL(string: "http://google.com")

import UIKit
let color1 = UIColor(white: 0.5, alpha: 1)
let color2 = UIColor(red: 0.75, green: 0, blue: 0, alpha: 0.5)

//: ## Массивы

[color1, color2]


let numbers: Array<Int> = [56, 78, 3, 10]
numbers[0]
numbers[3]

let new_array = numbers + [99]
numbers.count
new_array

//: ## Функции
//: Имеют область определения и область значений
func удвоить(x: Int) -> Int {
    return x * 2
}

let result = удвоить(10)
result

// a * x * x + b * x + c
func трёхчлен(x: Double, a: Double, b: Double, c: Double) -> Double
{
    return a * x * x + b * x + c
}

трёхчлен(5, a: 10, b: 0, c: 0) // 10 * x * x
трёхчлен(5, a: 0, b: 5, c: 0) // 5 * x

func трёхчлен(
      coef a: Double = 0,
    linear b: Double = 0,
     const c: Double = 0,
   atPoint x: Double
)          -> Double
{
    return a * x * x + b * x + c
}

// 10 * x * x + 50
трёхчлен(coef: 10, linear: 0, const: 50, atPoint: 6)

// 5 * x * x
трёхчлен(coef: 5, atPoint: 10)

func сложить(x:Double, _ y:Double, _ z:Double) -> Double {
    return x + y + z
}

сложить(30, 40, 50)

//: Создание dot-нотации 

extension Double {
    
    func трёхчлен(
          coef a: Double = 0,
        linear b: Double = 0,
         const c: Double = 0
    )          -> Double
    {
        return a * self * self + b * self + c
    }
    
}

6.7.трёхчлен()

6.трёхчлен(coef: 10, const: 50)

//: Операции со строками 
let ilya = "Илья"
let name = "Ваня"

ilya + " " + name
"На праздник пришли \(ilya) и \(name) и обсуждали \(numbers)"

extension String {
    func greet() -> String {
        return "Привет, \(self)!"
    }

    func sayGoodbye() -> String {
        return "До свидания, \(self)!"
    }    
}

(ilya + " и " + name).greet()
name.sayGoodbye()

extension String {
    func quote(by whom:String) -> String {
        return "\(whom) сказал: ❝\(self)❞."
    }
}

name.sayGoodbye().quote(by: ilya).quote(by: "Миша")

//: Изменяемость

var teacher = ilya
teacher.greet()
teacher = "Марат"
teacher.greet()

var changeable = numbers
changeable[0] = 14
print(changeable)

changeable
changeable.removeFirst()
changeable
numbers
changeable += [555]
changeable

var exchangeRate = 80.3
exchangeRate = 79
exchangeRate = 78

exchangeRate  * 11.5


//: ## Другие коллекции 

let numberSet = Set(numbers)
numberSet.minElement()
numberSet.maxElement()
numberSet.union([6,7,8])

numberSet.sort()
numbers.sort()

//: Словарь

let dict = [ilya: 40, name: 50, "Маша": 100]
Array(dict.keys)
Array(dict.values)
let keysAndValues = Array(dict)

let pair = (ilya, 50)

dict[ilya]
dict[name]
dict["Сергей"]


let something = dict[ilya]

var dict_copy = dict
dict_copy[ilya] = 100
dict_copy[name] = nil
dict_copy

//: ## Optionals

let url1 = NSURL(string: "фыавлопрфывра")
let url2 = NSURL(string: "http://wikipedia.org")

func stringFrom(maybe_url: NSURL?) -> String {
    
    guard let url = maybe_url
        else { return "неправильный URL" }
  
    guard let data = NSData(contentsOfURL: url)
        else { return "не получилось скачать" }
    
    guard let string = String(data: data, encoding: NSUTF8StringEncoding) else { return "неправильный encoding" }
    
    return string
}

Int("23645")
Int("6574df")


stringFrom(url2)

let json = NSURL(string: "https://raw.githubusercontent.com/ilyannn/iOS-Swift-Materials/master/CourseI/courses-v1.json")

func jsonFrom(maybe_url: NSURL?) -> AnyObject {
    
    guard let url = maybe_url
        else { return "неправильный URL" }
    
    guard let data = NSData(contentsOfURL: url)
        else { return "не получилось скачать" }
    
    guard let json = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
        else { return "неправильный JSON" }
    
    return json
}

stringFrom(json)


jsonFrom(json)[0]["logo"]




let rates_url = NSURL(string: "http://api.fixer.io/latest")

let rates = jsonFrom(rates_url)["rates"]
    as! Dictionary<String, Double>

rates.description
















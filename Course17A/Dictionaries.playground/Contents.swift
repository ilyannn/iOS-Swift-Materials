//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let strings = [str, "a", "b", "c"]

let populationData = ["Germany" : 80, "Russia": 150]

var dictionary = ["и": "und", "стол": "der Tisch", "окно": "das Fenster"]

dictionary["один"] = "eins"
    
dictionary["стол"]
dictionary["стул"]
populationData["Germany"]

Array(dictionary.keys)
Array(dictionary.values)

var any_dictionary: [String: Any] = [:]

any_dictionary["string"] = "value"
any_dictionary["float"] = 2.35
any_dictionary["array"] = [2, 3, 5]

any_dictionary

let formatter = NumberFormatter()
formatter.maximumFractionDigits = 1
let number = 3848652.35273645

let locale = NSLocale(localeIdentifier: "fr_FR")
formatter.locale = locale as Locale
formatter.string(from: NSNumber(value: number))

let dateFormatter = DateFormatter()
dateFormatter.dateStyle = .full
dateFormatter.timeStyle = .full

let now = Date()
dateFormatter.locale = locale as Locale
dateFormatter.string(from: now)


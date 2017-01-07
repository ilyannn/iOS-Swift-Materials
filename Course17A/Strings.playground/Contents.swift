//: Playground - noun: a place where people can play

import UIKit

//: ## String

var str = "Hello, playground"

let cafe  = "café..." // Alt + e
let cafe2 = "caf\u{65}\u{301}..."

cafe.characters.count
Array(cafe.characters)
Array(cafe.utf16)

cafe2.characters.count
Array(cafe2.characters)
Array(cafe2.utf16)

cafe == cafe2

let emoji = "I like 🇮🇹"
Array(emoji.characters)

let flag = "🇮🇹🇮🇹🇮🇹🇮🇹🇮🇹🇮🇹🇮🇹🇮🇹"
Array(flag.utf16)
Array(flag.unicodeScalars)
Array(flag.utf8)
flag.characters.count

// str = str + "!"
// str += "!"
//str.append("!")
str.insert("!", at: str.endIndex)
str.insert("→", at: str.startIndex)

var array = [5, 2, 1]
array.insert(1, at: array.endIndex)
array.insert(9, at: array.startIndex)

// в других языках str[5] <- обычно дает ответ не по стандарту Unicode
let index = str.index(str.startIndex, offsetBy: 5)
str.substring(to: index) + "^^^^^" + str.substring(from: index)


//: ## URL, Data, JSON

if let url = URL(string: "http://2.bp.blogspot.com/-6XOF7UWwTpY/UFyAnCSLjGI/AAAAAAAATbY/uMpq-Cvwvqg/s1600/kerala-model-home.jpg")
{
    let data = try Data(contentsOf: url)
    UIImage(data: data)
}

struct House {
    let pictureURL: String
    let text: String
    let place: String
    let size: Int
    
    init(dict: NSDictionary) {
        pictureURL = dict["picture"] as! String
        text = dict["text"] as! String
        place = dict["place"] as! String
        size = dict["size"] as! Int
    }
}

func LoadHouses() -> [House] {
    if let url = URL(string: "https://raw.githubusercontent.com/ilyannn/iOS-Swift-Materials/master/Course17A/HomeSearch/houses.json")
    {
        do {
            let data  = try Data(contentsOf: url)
            let json  = try JSONSerialization.jsonObject(with: data, options: [])
            
            let array = json as! [NSDictionary]
            
            return array.map { dict in
                House(dict: dict)
            }
        } catch {}
    }
    return []
}

let houses = LoadHouses()
let search = "Small"

houses
    .filter { house in
        house.place.contains(search) || house.text.contains(search)
    }






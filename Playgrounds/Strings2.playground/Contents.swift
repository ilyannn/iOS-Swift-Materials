let flag = "🇨🇭"

Array(flag.characters)
Array(flag.unicodeScalars)
Array(flag.utf16)
Array(flag.utf8)


import Foundation

func describe(string:String) -> String {

    let objc_string = NSString(string: string)
    let objc_length = objc_string.length
    let objc_chars  = (0..<objc_length).map(objc_string.characterAtIndex)
    
    return [
        string,
        "(swift) length = \(string.characters.count)",
        "(objc) length = \(objc_length)",
        "chars = \(objc_chars)"
        ].joinWithSeparator("\n")
}


let cafe1 = "café"
let cafe2 = "cafe\u{0301}"
cafe1 == cafe2

Array(cafe1.characters)
Array(cafe2.characters)

describe(flag)

describe("👹")
describe(cafe1)
describe(cafe2)

do {
    let regexp = try NSRegularExpression(pattern: cafe1, options: [])
    
    let string = cafe2
    let range = NSRange(location: 0, length: (string as NSString).length)
    
    regexp.matchesInString(string, options: [], range: range).count
}
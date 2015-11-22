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

describe(flag)

describe("👹")
describe(cafe1)
describe(cafe2)

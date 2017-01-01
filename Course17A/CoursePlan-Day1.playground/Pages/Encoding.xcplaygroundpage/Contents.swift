//: [Previous](@previous)

import Foundation

func decode(unit: UTF16Char) -> UTF16Char {
    return unit <= 32 ? unit : unit - 1
}
    
func decode(text:String) -> String {
    let units = text.utf16.map(decode)
    return String(utf16CodeUnits: units, count: units.count)
}

print(decode(text: try String(contentsOf: #fileLiteral(resourceName: "encoded.text"))))


//: [Next](@next)

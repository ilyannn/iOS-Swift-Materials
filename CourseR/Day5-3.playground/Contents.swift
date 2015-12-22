//: Playground - noun: a place where people can play

import UIKit

class Model: NSObject {
    var string: String? = "initial"
}

class ViewModel {
    
}

let nunmbers = [10, 6, 8, 9]
nunmbers.sort()

nunmbers.sort { a, b in
    return a < b
}


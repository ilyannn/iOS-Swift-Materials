//: Playground - noun: a place where people can play

import UIKit

class A {
    var count = 0
    
    var str = "" { didSet {
        count = str.characters.count
    }}
    
    init() {
        str = "Hello, world"
        count = str.characters.count
    }
}

let a = A()
a.count

a.str = "Hi there"
a.count

a.str = "asjdhfakjshdfas"
a.count

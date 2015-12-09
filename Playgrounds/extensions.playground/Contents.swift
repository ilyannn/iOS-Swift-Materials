//: Playground - noun: a place where people can play

import UIKit


protocol P1 {}
protocol P2 {}

extension P1 {
    
    func something() -> Int {
        return 1
    }

    func another() -> Int {
        return 1
    }
}

extension P2 {
    
    func something() -> Int {
        return 2
    }
    
    func another() -> Int {
        return 2
    }
}

class C1: P1, P2 {

    func something() -> Int {
        return 0
    }
    
}

C1().something() // class implementation, works as is
// C1().another() - ambigous, doesn't compile

protocol PP1 :P1 {
    func overrideable() -> Int
}

extension P1  {
    func overrideable() -> Int {
        return 1
    }
}

extension C1 {
    func overrideable() -> Int {
        return 0
    }
}

(C1() as P1).overrideable()



//
//  Type.swift
//  Day3
//
//  Created by iOS Swift Course on 12/4/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

//: Playground - noun: a place where people can play

import UIKit

struct S {
    let a = 5
    var b: Int
}

class Base {
    var basep: Int
    
    init() {
        basep = 10
    }
}


class A: Base {
    var a = 5
    var b: Int
    var stream1: NSObject
    var stream: NSObject
    
    final func configure() {
        a += 1
    }
    
    init?(fail: Bool) {

        if fail {

            stream1 = NSObject()
            stream = NSObject()
            b = 67
            
            super.init()
            
            return nil
            
        } else {
            a = 100
            b = 100
            stream = NSObject()
            stream1 = NSObject()
            super.init()
        }
    }
    
    init(b: Int = 6) {
        
        // first init phase
        self.b = b
        self.a = 36
        stream = NSObject()
        stream1 = NSObject()
        
        // вызов super
        super.init()
        
        // появился self
        // second init phase
        configure()
    }
    
    convenience init(another:Int) {
        self.init(b: another)
    }
    
    deinit {
        stream.description
    }
}

class B:A {
    var c:Int
    
    //    override func configure() {
    //        super.configure()
    //        b += 1
    //    }
    
    override init(b: Int) {
        c = 10
        super.init(b: 6)
    }
}

func stuff() {
    let a = A(b: 7)
    let s = S(b: 6)
    
    let b = B(b: 7)
    B(b: 50)
    
    A(fail: true)
    A(fail: false)
    
    A(fail: true)
}

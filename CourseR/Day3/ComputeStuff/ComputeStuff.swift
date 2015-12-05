//
//  ComputeStuff.swift
//  Day3
//
//  Created by iOS Swift Course on 12/4/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import Foundation

protocol P {
    
}

// аналог #define константа или функция
private let InitialValue = 5

private let $: Int -> Int = { $0 * $0 }
private let ff = { (a:Int) in a * a }

public func test() -> Int -> Int {

    var a:(Int) -> Int = { v in 0  }
    let b:(Int) -> Int = { v in a(v) }
    a = { v in v == 0 ? 0: b(v-1) + 1 }
    
    return b
}

public protocol Utility {
    func utility()
}

extension String:Utility {

    public func utility() {
        
    }
}

private class X:P {

    class XX {
        
        func f() -> Int {
            return $(InitialValue)
        }
    }

    func f() -> Int {
        return shifted(by: 1)(10)
    }
    
    func shifted(by value: Int) -> Int -> Int {
        return {
            $0 + value
        }
    }
}

internal class Y:P {
    
    private let x = X()
    
    func f() -> Int {
        return $(x.f())
    }
}
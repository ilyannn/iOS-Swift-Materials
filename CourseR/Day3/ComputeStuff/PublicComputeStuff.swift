//
//  PublicComputeStuff.swift
//  Day3
//
//  Created by iOS Swift Course on 12/4/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import Foundation

public class Z:P {
    
    let y = Y()
    
    public init() {}

}

public extension Z {
    
    func f() -> Int {
        return y.f()
    }
    
}
//
//  Purschase.swift
//  Day3-Purchases
//
//  Created by iOS Swift Course on 9/5/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

class Purchase {
    
    let name: String
    let price: Double
    let quantity: Double
    let color: UIColor
    
    init() {
        name = "Покупка"
        price = Double(rand() % 10000)
        quantity = Double(rand() % 4) + 1
        color = .blackColor()
    }
    
    var totalAmount: Double {
        return price * quantity
    }
    
    var description: String {
        return "\(quantity) \(name) за \(price) = \(totalAmount)"
    }
}

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
    let quantity: Int
    let color: UIColor
    
    init() {
        name = ["Специи", "Еда", "Мясо", "Пироги", "Бургеры"][Int(rand() % 5)]
        price = Double(rand() % 10000) / 100
        quantity = Int(rand() % 40) + 1
        color = .blackColor()
    }
    
    var totalAmount: Double {
        return price * Double(quantity)
    }
    
    var description: String {
        return "\(quantity) \(name) за \(price) = \(totalAmount)"
    }
}

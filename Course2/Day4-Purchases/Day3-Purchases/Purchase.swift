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
        color = UIColor(hue: CGFloat(rand() % 10) / 10, saturation: 0.3, brightness: 0.3, alpha: 1)
    }
    
    init(name_: String, quantity_: Int, price_: Double) {
        name = name_
        quantity = quantity_
        price = price_
        color = UIColor.blackColor()
    }
    
    var totalAmount: Double {
        return price * Double(quantity)
    }
    
    var description: String {
        let formatter = NSNumberFormatter()
        formatter.maximumFractionDigits = 2
        
        let price_text = formatter.stringFromNumber(price) ?? ""
        let total_text = formatter.stringFromNumber(totalAmount) ?? ""
        
        return "\(quantity) \(name) за \(price_text) = \(total_text)"
    }
}

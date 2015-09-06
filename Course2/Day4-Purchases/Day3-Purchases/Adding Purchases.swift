//
//  Adding Purchases.swift
//  Day4-Purchases
//
//  Created by iOS Swift Course on 9/6/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var quantitySelector: UIStepper!
    
    @IBOutlet weak var purchaseNameField: UITextField!
    
    @IBAction func quantityChanged(sender: AnyObject) {
        let quantity = Int(quantitySelector.value)
        quantityLabel.text = "\(quantity)"
    }
}
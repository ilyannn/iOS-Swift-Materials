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

    @IBOutlet weak var purchasePriceField: UITextField!
    
    var selectedQuantity: Int {
        return Int(quantitySelector.value)
    }
    
    @IBAction func quantityChanged(sender: AnyObject) {
        quantityLabel.text = "\(selectedQuantity)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.layer.cornerRadius = 10
    }
}
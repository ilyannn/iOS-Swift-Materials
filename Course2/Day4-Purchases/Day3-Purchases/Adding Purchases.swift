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

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var purchasePriceField: UITextField!
    
    @IBOutlet weak var gradientView: GradientView!
    
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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        gradientView.reverseColors()
        
        let address = "http://www.wpclipart.com/signs_symbol/BW/BW_4/ticket_purchase.png"
        
        if let url = NSURL(string: address) {
            
            if let imageData = NSData(contentsOfURL: url) {
                let image = UIImage(data: imageData)
                imageView.image = image
            }
            
        } else {
            
            print("Не получилось, плохой URL")
            
        }

    }
}
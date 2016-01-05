//
//  ViewController.swift
//  Day2-App
//
//  Created by iOS Swift Course on 1/5/16.
//  Copyright © 2016 iOS Swift Course. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let myName = "ilya"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var legalNotice: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var loginField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginField.text = myName
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .MediumStyle
        countLabel.text = formatter.stringFromDate(NSDate())

        countLabel.textColor = UIColor(white: 0.3, alpha: 1)
        countLabel.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.1)
        
        blueButton.layer.cornerRadius = 10
        redButton.layer.cornerRadius = 30
        greenButton.layer.cornerRadius = 60
    }

}


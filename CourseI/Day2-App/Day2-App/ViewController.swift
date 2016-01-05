//
//  ViewController.swift
//  Day2-App
//
//  Created by iOS Swift Course on 1/5/16.
//  Copyright © 2016 iOS Swift Course. All rights reserved.
//

import UIKit

private let π = CGFloat(M_PI)

class ViewController: UIViewController {

    let myName = "ilya"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var legalNotice: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var ghostButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginField.text = myName
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .MediumStyle
        countLabel.text = formatter.stringFromDate(NSDate())

        countLabel.textColor = UIColor(white: 0.3, alpha: 1)
        countLabel.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.1)
        
        loginField.textColor = UIColor.whiteColor()
        loginField.backgroundColor = UIColor.brownColor()

        blueButton.layer.cornerRadius = 10
        redButton.layer.cornerRadius = 30
        greenButton.layer.cornerRadius = 60
        
        greenButton.setTitleColor(countLabel.textColor, forState: .Normal)
        
        ghostButton.layer.cornerRadius = ghostButton.bounds.size.height / 2
    }

    func animateGhost() {
        
        ghostButton.transform = CGAffineTransformMakeScale(5, 5)
        ghostButton.alpha = 0
        ghostButton.backgroundColor = UIColor.clearColor()

        blueButton.layer.transform = CATransform3DMakeRotation(π, 0, 1, 0)
        redButton.transform = CGAffineTransformMakeRotation(π)
        
        swap(&greenButton.backgroundColor,
             &redButton.backgroundColor)
        
        blueButton.center.y += 50
    }
    
    func animateGreen() {
//        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationRepeatCount(8)
        UIView.setAnimationCurve(.Linear)
        greenButton.transform = CGAffineTransformMakeRotation(π/2)
    }
    
    @IBAction func ghostAppears(sender: AnyObject) {
    
        UIView.animateWithDuration(0.33, delay: 0, options: [.Autoreverse], animations: animateGhost, completion: nil)
        
        UIView.animateWithDuration(0.33 / 2, animations: animateGreen)
    }
}


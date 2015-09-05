//
//  ViewController.swift
//  Course2-Day3-Buttons
//
//  Created by iOS Swift Course on 9/5/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit
import QuartzCore

let π = CGFloat(M_PI)

class ViewController: UIViewController {

    // Связь с элементами экрана
    
    @IBOutlet weak var animalsView: UIImageView!

    // То, что просходит при создании экрана
    
    @IBOutlet weak var semihiddenButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: 50, y: 50, width: 250, height: 60)
        let button = UIButton(frame: frame)
        
        button.setTitle("Кнопка", forState: .Normal)
        button.setTitle("Нажата", forState: .Highlighted)

        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        button.backgroundColor = UIColor.blueColor()
        button.alpha = 0.3
        
        // Только в коде
        button.layer.cornerRadius = 15
        button.transform = CGAffineTransformMakeRotation(0.2)
        
        view.addSubview(button)
        view.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.9)
        
        animalsView.clipsToBounds = true

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        animalsView.layer.cornerRadius = animalsView.bounds.size.height/2

        semihiddenButton.layer.transform = CATransform3DMakeTranslation(0, 0, 40)
    }
    
    
    // При нажатии кнопки
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        animalsView.highlighted = !animalsView.highlighted
        
    }
    
    @IBAction func brownButtonTapped(sender: AnyObject) {

        self.animalsView.layer.transform = CATransform3DIdentity

        UIView.animateWithDuration(3) {
        self.animalsView.layer.transform = CATransform3DMakeRotation(π, 1, 0, 0)
        }
    }
}


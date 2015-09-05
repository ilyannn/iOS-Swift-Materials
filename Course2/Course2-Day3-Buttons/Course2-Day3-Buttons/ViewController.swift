//
//  ViewController.swift
//  Course2-Day3-Buttons
//
//  Created by iOS Swift Course on 9/5/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Связь с элементами экрана
    
    @IBOutlet weak var animalsView: UIImageView!

    // То, что просходит при создании экрана
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: 50, y: 50, width: 250, height: 60)
        let button = UIButton(frame: frame)
        
        button.setTitle("Кнопка", forState: .Normal)
        button.setTitle("Нажата", forState: .Highlighted)

        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        button.backgroundColor = UIColor.blueColor()
        button.layer.cornerRadius = 15
        button.alpha = 0.3
        button.transform = CGAffineTransformMakeRotation(0.1)
        
        view.addSubview(button)
        view.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.9)
        
        animalsView.clipsToBounds = true
    }

    // При нажатии кнопки
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        animalsView.highlighted = !animalsView.highlighted
        animalsView.layer.cornerRadius = animalsView.highlighted ? animalsView.bounds.size.height/2 : 0
    }
    
}


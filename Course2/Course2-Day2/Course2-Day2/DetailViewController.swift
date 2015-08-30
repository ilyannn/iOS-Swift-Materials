//
//  DetailViewController.swift
//  Course2-Day2
//
//  Created by iOS Swift Course on 8/30/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

let π = CGFloat(M_PI)

class DetailViewController: UIViewController {

    var greeting:String = "Привет, кто-то!"
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var anotherButton: UIButton!
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    @IBOutlet weak var buySomethingButton: UIButton!
    
    func rotate(view: UIView) {
        
        UIView.animateWithDuration(2) {
            view.transform = CGAffineTransformMakeRotation(π)
            view.alpha = 0
        }
    }
    
    // Проваливаться в определение Command + мышь
    // Показать помощь Alt + мышь
    //   - там будет определение
    //   - там будет ссылка на большой help
    @IBAction func buySomething(sender: AnyObject) {
        detailDescriptionLabel.text = greeting
        
        detailDescriptionLabel.textColor = UIColor(red: 0.9, green: 0, blue: 0.3, alpha: 1)

        rotate(buySomethingButton)
        rotate(detailDescriptionLabel)
        
        detailDescriptionLabel.backgroundColor = UIColor(hue: 0.5, saturation: 0.5, brightness: 0.5, alpha: 1)
    }
    
    @IBAction func swipeLeft(sender: AnyObject) {
        detailDescriptionLabel.textAlignment = .Left
        
        buySomethingButton.backgroundColor = UIColor.greenColor()
        
        buySomethingButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal )
    }
    
    @IBAction func swipeRight(sender: AnyObject) {
        detailDescriptionLabel.textAlignment = .Right
        buySomethingButton.backgroundColor = UIColor.redColor()
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()

        // Домашнее задание 2
        // makeRound(buySomethingButton)
        // makeRound(detailDescriptionLabel)
        
        buySomethingButton.layer.cornerRadius = buySomethingButton.bounds.size.height / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


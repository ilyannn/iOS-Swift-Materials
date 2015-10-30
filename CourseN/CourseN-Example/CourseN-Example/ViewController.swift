//
//  ViewController.swift
//  CourseN-Example
//
//  Created by iOS Swift Course on 10/29/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bigRedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bigRedButton.layer.cornerRadius = bigRedButton.bounds.size.height/2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        bigRedButton.backgroundColor = UIColor.greenColor()
    }

}


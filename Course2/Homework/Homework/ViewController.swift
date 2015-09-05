//
//  ViewController.swift
//  Homework
//
//  Created by iOS Swift Course on 9/5/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        blueButton.layer.cornerRadius = blueButton.bounds.size.height/2
    }

    @IBOutlet weak var blueButton: UIButton!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


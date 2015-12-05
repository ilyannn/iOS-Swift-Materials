//
//  ViewController.swift
//  Day3
//
//  Created by iOS Swift Course on 12/4/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import ComputeStuff


class ViewController: UIViewController {
    
    let z = Z()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let t = test()
        t(10)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

public protocol Utility {
    func utility()
}

extension String:Utility {
    
    public func utility() {
        
    }
}


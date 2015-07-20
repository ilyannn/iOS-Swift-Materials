//
//  ViewController.swift
//  Day2-App
//
//  Created by iOS Swift Course on 7/19/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var helloButton: UIButton!
    @IBOutlet weak var animalView: UIImageView!
    
    @IBAction func changePicture(sender: AnyObject) {
        animalView.highlighted = true
        
        let layer = animalView.layer

        UIView.animateWithDuration(3.0, animations: {
            let angle = CGFloat(M_PI)
            //            let transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
            //
            //            temp.transform = transform
            
            let transform3d = CATransform3DMakeRotation(angle, 1, 0, 0)
            layer.transform = transform3d
        })
        
    }
    
    @IBAction func cancelChange(sender: AnyObject) {
        animalView.highlighted = false
        let layer = animalView.layer

        UIView.animateWithDuration(3.0, animations: {
            layer.transform = CATransform3DIdentity
             // layer.transform = Transform3D()
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layer = animalView.layer

        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.redColor().CGColor
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        view.layoutIfNeeded()
        
        let temp = animalView
        let layer = animalView.layer
        let radius = 0.5 * temp.bounds.size.width
        
        layer.cornerRadius = radius
        
    }
}


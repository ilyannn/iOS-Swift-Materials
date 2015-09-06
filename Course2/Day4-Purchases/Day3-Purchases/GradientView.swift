//
//  GradientView.swift
//  Day4-Purchases
//
//  Created by iOS Swift Course on 9/6/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable
class GradientView: UIView {

    override class func layerClass() -> AnyClass {
        return CAGradientLayer.self
    }

    @IBInspectable var startColor: UIColor! = .greenColor()
    @IBInspectable var centerColor: UIColor! = .blueColor()
    @IBInspectable var endColor: UIColor! = .blueColor()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        guard let gradient = layer as? CAGradientLayer else {
            return
        }
        
        gradient.colors = [startColor.CGColor, centerColor.CGColor, endColor.CGColor]

        gradient.locations = [0.3, 0.6, 0.7]
        
        layer.cornerRadius = bounds.size.height/2
    }
    
    func reverseColors() {
        UIView.animateWithDuration(2, delay: 0, options: .Autoreverse, animations: { () -> Void in
            self.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            }, completion:{_ in })
    }
}

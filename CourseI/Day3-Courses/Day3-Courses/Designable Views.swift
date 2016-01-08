//
//  Designable Views.swift
//  Day3-Courses
//
//  Created by iOS Swift Course on 1/8/16.
//  Copyright © 2016 iOS Swift Course. All rights reserved.
//

import UIKit

@IBDesignable
class RoundPhotoView: UIImageView {
    
    @IBInspectable var rotateAngle: CGFloat = 0

    @IBInspectable var borderWidth: CGFloat = 0
    
    @IBInspectable var borderColor: UIColor = UIColor.clearColor()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let radius = 0.5 * bounds.height
        layer.cornerRadius = radius
        clipsToBounds = true
        
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.CGColor
        
        transform = CGAffineTransformMakeRotation(rotateAngle)
    }
}

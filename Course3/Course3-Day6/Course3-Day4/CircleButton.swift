//
//  CircleButton.swift
//  Course3-Day6
//
//  Created by iOS Swift Course on 12/6/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

let π = CGFloat(M_PI)

@IBDesignable class CircleButton: UIButton {
    
    @IBInspectable var arcColor: UIColor? { didSet {
        circle?.strokeColor = arcColor?.CGColor
    }}
    
    @IBInspectable var directionDown: Bool = false { didSet {
        configure()
    }}
    
    @IBInspectable var radius: CGFloat = 0 { didSet {
        configure()
    }}

    func configure() {
        
        circle = CAShapeLayer()
        circle?.position = CGPoint(x: bounds.size.width/2, y: bounds.size.height / 2)
        circle?.lineWidth = 2
        circle?.strokeColor = arcColor?.CGColor
        circle?.fillColor = UIColor.yellowColor().CGColor
        circle?.path = UIBezierPath(arcCenter: CGPointZero, radius: radius, startAngle: 0, endAngle: π, clockwise: directionDown).CGPath

/*        let animation = CABasicAnimation(keyPath: "transform.rotation.x")

        animation.fromValue = 0
        animation.toValue = π
        animation.additive = true
        animation.fillMode = kCAFillModeForwards
        animation.duration = 10
        
        circle?.addAnimation(animation, forKey: "rotate")
*/    }

    weak var circle: CAShapeLayer? { didSet {
        
        oldValue?.removeFromSuperlayer()
        
        if let c = circle {
            layer.insertSublayer(c, atIndex: 0)
        }
    }}

    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        
        if let hit = super.hitTest(point, withEvent: event) {
            
            if hit == self {
                
                let center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
                
                let dx = center.x - point.x
                let dy = center.y - point.y
                
                let dist_sq = dx * dx + dy * dy

                if dist_sq > radius * radius {
                    return nil
                }
            }
            
            return hit
        }
        
        return nil
    }
}


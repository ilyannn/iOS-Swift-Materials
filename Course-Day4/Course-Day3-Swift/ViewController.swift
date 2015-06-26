//
//  ViewController.swift
//  Course-Day3-Swift
//
//  Created by Ilya Nikokoshev on 25/06/15.
//  Copyright © 2015 Boloid. All rights reserved.
//

import UIKit

private class RectangleView: UIImageView {

    var selected:Bool {
        didSet {
            backgroundColor = selected ? .purpleColor() : nil
        }
    }
    
    init(border: UIColor) {
        selected = false
        
        super.init(frame: CGRectZero)

        image = UIImage(named: "dog.jpg")
        contentMode = .ScaleAspectFill
        layer.masksToBounds = true
        layer.borderWidth = 3.0   
        layer.shadowOpacity = 0
        layer.borderColor = border.CGColor        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("Not implement")
    }
    
    private override func touchesBegan(touches: Set<UITouch>, 
        withEvent event: UIEvent?) 
    {
        super.touchesBegan(touches, withEvent: event)
        
        selected = true        
    }
    
    private override func touchesEnded(touches: Set<UITouch>, 
        withEvent event: UIEvent?) 
    {
        super.touchesEnded(touches, withEvent: event)
        
        selected = false
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    

    func addRectange(center: CGPoint) {
        let secondView = RectangleView(border: .blackColor() )
                
        secondView.center = center
        secondView.bounds = CGRect(x: 0, y: 0, width: 100, height: 60)

        secondView.layer.cornerRadius = 10

        UIView.animateWithDuration(4.0, 
            delay: 0, 
            options: UIViewAnimationOptions.AllowUserInteraction, 
            animations: { () -> Void in

                secondView.center = CGPoint(x: center.x + 100, y: center.y + 100 )
                secondView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            
            }, completion: {_ in }) 
        
        view.addSubview(secondView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        for point in points {
            addRectange(point)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


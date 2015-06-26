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
    
    func readPoints() -> [CGPoint] {
        let URL = NSURL(string: "https://raw.githubusercontent.com/ilyannn/iOS-Swift-Materials/master/Course-Day4/coords.txt")!
        
        let data = try! String(contentsOfURL: URL, encoding: NSUTF8StringEncoding)

        let strings = data.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
        
        return strings.flatMap { string in 
            let chunks = string.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            let numbers = chunks.flatMap { Int($0) }
            
            if (numbers.count != 2) {
                return nil
            }
            
            return CGPoint(x: numbers[0], y: numbers[1])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let points = readPoints()
        for point in points {
            addRectange(point)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


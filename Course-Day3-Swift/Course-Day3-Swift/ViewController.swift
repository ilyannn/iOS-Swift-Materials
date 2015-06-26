//
//  ViewController.swift
//  Course-Day3-Swift
//
//  Created by Ilya Nikokoshev on 25/06/15.
//  Copyright © 2015 Boloid. All rights reserved.
//

import UIKit

class Animal {
    let type: String
    
    init(type: String) {
        self.type = type
    }
}

class Dog: Animal {
    let breed: String
    
    init(breed: String) {
        self.breed = breed
        super.init(type: "Dog")
        
        self.configure()
    }
    
    func configure() {
        
    }
}

private class RectangleView: UIView {

    let borderColor:UIColor = .blackColor() 
    
    var selected:Bool {
        didSet {
            backgroundColor = selected ? .purpleColor() : nil
        }
    }
    
    override init(frame: CGRect) {
        selected = false

        super.init(frame: frame)

        backgroundColor = nil
        layer.borderWidth = 3.0        
        layer.borderColor = borderColor.CGColor        
        bounds = CGRect(x: 0, y: 0, width: 100, height: 60)
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
    
    private override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: <#T##UIEvent?#>)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    

    func addRectange(center: CGPoint) {
        let secondView = RectangleView()
                
        secondView.center = center
        
        view.addSubview(secondView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let points = [CGPoint(x: 100, y: 100), 
            CGPoint(x: 200, y: 300), 
            CGPoint(x: 100, y: 500)
        ]

        for point in points {
            addRectange(point)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


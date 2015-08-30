//
//  ViewController.swift
//  Course-Day3-Swift
//
//  Created by Ilya Nikokoshev on 25/06/15.
//  Copyright © 2015 Boloid. All rights reserved.
//

import UIKit

class AnimalView: UIImageView {

    var victoryBlock: (AnimalView) -> () = {_ in }
    
    var selected:Bool {
        didSet {
            layer.borderColor = selected ? UIColor.yellowColor().CGColor : nil
        }
    }
    
    var tapped:Bool {
        didSet {
            image = UIImage(named: tapped ? "cat.jpg" : "dog.jpg")!
        }
    }
        
    init(border: UIColor) {
        selected = false
        tapped = false
        
        super.init(frame: CGRectZero)

        image = UIImage(named: "dog.jpg")
        contentMode = .ScaleAspectFill
        userInteractionEnabled = true
        
        layer.masksToBounds = true
        layer.borderWidth = 3.0   
        layer.shadowOpacity = 0
        layer.borderColor = border.CGColor        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, 
        withEvent event: UIEvent?) 
    {
        super.touchesBegan(touches, withEvent: event)
        
        tapped = true
        
        victoryBlock(self)
    }
    
    override func touchesEnded(touches: Set<UITouch>, 
        withEvent event: UIEvent?) 
    {
        super.touchesEnded(touches, withEvent: event)
        
        tapped = false
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var victoryLabel: UILabel!
    
    var animals: [AnimalView] = []
    var expected: AnimalView?
    
    var level = 0 {
        didSet {
            victoryLabel.text = "Level: \(level)"
        }
    }

    @IBAction func fire(sender: AnyObject) {
            
        NSTimer.scheduledTimerWithTimeInterval(1.0, 
            target: self, 
            selector: "selectRandom:", 
            userInfo: nil, 
            repeats: false
        )
        
    }

    func selectRandom(sender:AnyObject?) {
        let random_number = random() % animals.count
        expected = animals[random_number]
        expected?.selected = true

        NSTimer.scheduledTimerWithTimeInterval(0.5 / pow(1.7, Double(level + 1)), 
            target: self, 
            selector: "unselectAnimal:", 
            userInfo: expected, 
            repeats: false
        )
    }
    
    func unselectAnimal(sender:NSTimer) {
        let animal = sender.userInfo as? AnimalView
        animal?.selected = false
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
         return .LightContent
    }
    
    func addAnimal(center: CGPoint) {
        let animalView = AnimalView(border: .blackColor() )
                
        animalView.center = center
        animalView.bounds = CGRect(x: 0, y: 0, width: 100, height: 60)
        animalView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))

        animalView.layer.cornerRadius = 10
        
        animalView.victoryBlock = { animal in
            if (animal == self.expected) {
                self.level++
                if (self.level == self.animals.count) {
                    self.victoryLabel.backgroundColor = .greenColor()
                    self.level = 0
                }
            } else {
                self.victoryLabel.backgroundColor = .redColor()
                self.level = 0
            }
        }
        
        UIView.animateWithDuration(1.0, 
            delay: 0, 
            options: UIViewAnimationOptions.AllowUserInteraction, 
            animations: { () -> Void in

                animalView.center = CGPoint(x: center.x, y: center.y + 100 )
                animalView.transform = CGAffineTransformMakeRotation(CGFloat(0))
            
            }, completion: {_ in }) 
        
        animals += [animalView]
        
        view.addSubview(animalView)
    }
    
    func readPoints() -> [CGPoint] {
        let URL = NSURL(string: "https://raw.githubusercontent.com/ilyannn/iOS-Swift-Materials/master/Course-Day4/coords2.txt")!
        
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
            addAnimal(point)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  Course3-Day2
//
//  Created by iOS Swift Course on 11/22/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let titleColor = UIColor(red: 0, green: 1, blue: 0.1, alpha: 1)

    var animals = ["Кошка", "Собака"]
    
    @IBOutlet weak var screenTitle: UILabel!
    @IBOutlet weak var screenSubtitle: UILabel!
    @IBOutlet weak var catPicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        catPicture.layer.cornerRadius = 30
        screenTitle.text = "Заголовок экрана"
        screenTitle.textColor = titleColor

        //        screenSubtitle.text = "Подзаголовок!"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var angle:CGFloat = 0
    let π = CGFloat(M_PI)
    
    func animate() {
        screenTitle.alpha = 1 - screenTitle.alpha
        
        angle = angle + π/2
        catPicture.transform = CGAffineTransformMakeRotation(angle)

        screenSubtitle.textColor = UIColor(hue: 0.3, saturation: 1, brightness: 0.1, alpha: 1)
        
        screenTitle.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.075)
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        screenSubtitle.text = "catPicture.center = \(catPicture.center)"
        catPicture.highlighted = !catPicture.highlighted
        UIView.animateWithDuration(1, animations: animate)
    }

}


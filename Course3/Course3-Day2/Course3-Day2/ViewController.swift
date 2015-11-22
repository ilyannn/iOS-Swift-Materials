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
        
        screenTitle.text = "Заголовок экрана"
        screenTitle.textColor = titleColor
        
        screenSubtitle.text = "Подзаголовок!"
        screenSubtitle.textColor = UIColor(hue: 0.3, saturation: 1, brightness: 0.1, alpha: 1)
        
        screenTitle.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.075)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


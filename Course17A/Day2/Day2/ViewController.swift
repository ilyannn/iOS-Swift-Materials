//
//  ViewController.swift
//  Day2
//
//  Created by iOS Swift Course on 1/4/17.
//  Copyright © 2017 iOS Swift Course. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var seasonPhoto: UIImageView!
    @IBOutlet weak var charactersButton: UIButton!
    @IBOutlet weak var episodeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        charactersButton.backgroundColor = UIColor.red
        charactersButton.layer.cornerRadius = 20
        
//        seasonPhoto.transform = CGAffineTransform(rotationAngle: 3.14/12)
     
        UIView.animate(withDuration: 5) {
            self.seasonPhoto.layer.transform = CATransform3DMakeRotation(3.14/4, 1, -1, 1)
        }
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.autoreverse, .repeat, .allowUserInteraction],
                       animations:
        {
            self.charactersButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            
        }, completion: {_ in })
        
        seasonPhoto.layer.cornerRadius = 20
        seasonPhoto.clipsToBounds = true
        
        episodeLabel.text = episodeLabel.text?.uppercased()
        episodeLabel.layer.shadowColor = UIColor.black.cgColor
        episodeLabel.layer.shadowOpacity = 1
        episodeLabel.layer.shadowOffset = CGSize(width: 3, height: 3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


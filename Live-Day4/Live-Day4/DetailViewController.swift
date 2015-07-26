//
//  DetailViewController.swift
//  Live-Day4
//
//  Created by iOS Swift Course on 7/25/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var personBigAvatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!


    var detailItem: Person? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        guard let person = self.detailItem else { return }

        print(self.view)
        personBigAvatar.image = person.image
        nameLabel.text = person.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func avatarTapped(sender: AnyObject) {
        
    }

    @IBOutlet var swipeUp: UISwipeGestureRecognizer!
    
    @IBOutlet var swipeDown: UISwipeGestureRecognizer!
    
    @IBAction func userSwipedUp(sender: AnyObject) {
        zoom(2)
    }
    
    @IBAction func userSwipedDown(sender: AnyObject) {
        zoom(0.5)
    }
    
    @IBOutlet var twoTapper: UITapGestureRecognizer!
    
    @IBAction func userTappedTwoFingersTwice(sender: AnyObject) {
        personBigAvatar.contentMode = .ScaleAspectFill
    }
    
    @IBOutlet var pinchRecognizer: UIPinchGestureRecognizer!
    
    func zoom(scale: CGFloat) {
        let currentScale = self.personBigAvatar.frame.size.width / self.personBigAvatar.bounds.size.width
        
        var newScale = currentScale*scale
        
        if newScale < 1 {
            newScale = 1
        }
        if newScale > 9 {
            newScale = 9
        }
        
        let transform = CGAffineTransformMakeScale(newScale, newScale)
        
        self.personBigAvatar.transform = transform
//        sender.scale = 1
        
    }
    
    @IBAction func userPinched(sender:UIPinchGestureRecognizer) {
        
        if sender.state == .Ended || sender.state == .Changed {
            
            zoom(sender.scale)
        }
        
    }
    
}


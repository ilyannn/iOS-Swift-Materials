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
        
        for (index, badge) in person.badges.enumerate() {
            let x = 30 + 100 * index
            
            let frame = CGRect(x: x, y: 100, width: 80, height: 30)
            let button = UIButton(frame: frame)
            
            button.setTitle(badge, forState: .Normal)
            button.setTitleColor(.redColor(), forState: .Normal)
            
            button.layer.cornerRadius = 5
            button.layer.borderColor = UIColor.redColor().CGColor
            button.layer.borderWidth = 2
            
            button.addTarget(self,
                action: "badgePressed:",
                forControlEvents: .TouchUpInside)
            
            view.addSubview(button)
        }
        
    }

    var badgePressed: String? = nil
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let viewController = segue.destinationViewController
        viewController.title = badgePressed
    }
    
    func badgePressed(sender: UIButton) {
/*
        let interval: NSTimeInterval = 1.0
        
        let animations: () -> Void = { () in
            sender.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
        }
        
        UIView.animateWithDuration(interval, animations: animations)
*/
        badgePressed = sender.titleForState(.Normal)
        performSegueWithIdentifier("showTabView", sender: sender)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    // MARK: Image picker controller

    let imagePicker = UIImagePickerController()
}


extension DetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
    
    @IBAction func avatarTapped(sender: AnyObject) {
//        imagePicker.sourceType = .Camera
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController,
          didFinishPickingImage image: UIImage,
                          editingInfo: [String : AnyObject]?)
    {
        let beginImage = CIImage(image: image)
        
        // 3
        guard let filter = CIFilter(name: "CISepiaTone") else { return }
        
        filter.setValue(beginImage, forKey: kCIInputImageKey)
        filter.setValue(0.9, forKey: kCIInputIntensityKey)
        
        // 4
        let newImage = UIImage(CIImage: filter.outputImage)
        
        // что-то сделать
        personBigAvatar.image = newImage
        
        // завершить работу UIImagePickerController
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}



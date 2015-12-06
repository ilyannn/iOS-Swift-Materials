//
//  DetailViewController.swift
//  Course3-Day4
//
//  Created by iOS Swift Course on 12/5/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate: NSObjectProtocol {
    func detailController(detail:DetailViewController,
        changePhotoTo:UIImage, inTrip trip:Trip)
}

class DetailViewController: UIViewController {

    @IBOutlet var megaCoordinator: MegaCoordinator!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pictureView: UIImageView!
    
    @IBOutlet var tapRecognizer: UITapGestureRecognizer!
    
    weak var delegate: DetailViewControllerDelegate?
    var currentTrip: Trip?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        percentLabel.layer.cornerRadius =
        percentLabel.bounds.size.height / 2
        
        contentView.layer.cornerRadius = 40
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        super.motionEnded(motion, withEvent: event)
        
        if motion == .MotionShake {
            dismissViewControllerAnimated(true) {}
        }
    }
    
    @IBAction func tapPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    func configureWithTrip(trip: Trip) {

        loadViewIfNeeded()
        
        currentTrip = trip
        
        descriptionLabel.text = trip.tripDescription
        percentLabel.text = " \(trip.hitPercent) % "
        
        trip.configureImageView(pictureView)
    }

    func moveIfNecessary(touches: Set<UITouch>) {
        if touches.count == 1 {
            let touch = Array(touches)[0]
            let loc = touch.locationInView(contentView)
            
            percentLabel.center = loc
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        super.touchesBegan(touches, withEvent: event)
        moveIfNecessary(touches)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        super.touchesMoved(touches, withEvent: event)
        moveIfNecessary(touches)
    }

    @IBOutlet var doubleTap: UITapGestureRecognizer!
    
    @IBAction func doubleTapPressed(sender: UITapGestureRecognizer) {
        
        let loc = sender.locationInView(contentView)
        let size = CGSize(width: 120, height: 30)
        let frame = CGRect(origin: loc, size: size)

        let new_view = UIButton(type: .Custom)
        new_view.frame = frame
        new_view.backgroundColor = UIColor.clearColor()
        
        new_view.setTitle("x:\(loc.x) y:\(loc.y)", forState: .Normal)
        new_view.setTitle("нажата", forState: .Highlighted)

        new_view.addTarget(self, action: "customButtonPressed:", forControlEvents: .TouchUpInside)
        
        contentView.addSubview(new_view)
    }
    
    func customButtonPressed(sender: UIButton) {
        descriptionLabel.text = sender.titleForState(.Normal)
        createNotification()
    }
    
    @IBAction func changePhoto(sender: AnyObject) {
        
        let vc = UIImagePickerController()
        vc.delegate = self

        presentViewController(vc, animated: true) {}
    }
    
    @IBOutlet weak var displayMyself: UIButton!
    
    @IBAction func doDisplayMyself(sender: AnyObject) {

        let instatiated = storyboard?.instantiateViewControllerWithIdentifier("detail")
        
        if  let vc   = instatiated as? DetailViewController,
            let trip = currentTrip
        {
            vc.configureWithTrip(trip)
            presentViewController(vc, animated: true) {}
        }
    }

    @IBAction func openPhotoURL(sender: AnyObject) {
        
        if let url = currentTrip?.pictureURL {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    func createNotification() {

        let settings = UIUserNotificationSettings(forTypes: .Badge, categories: nil)
        let application = UIApplication.sharedApplication()
        
        application.registerUserNotificationSettings(settings)
        
        let not = UILocalNotification()
        not.fireDate = NSDate(timeIntervalSinceNow: 3)
        
        not.alertTitle = "Заявка одобрена"
        not.alertBody = "Тур XXX успешно куплен"
        
        application.scheduleLocalNotification(not)
    }
}

extension DetailViewController:
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
{
    func imagePickerController(   picker: UIImagePickerController,
         didFinishPickingImage     image: UIImage,
         editingInfo                    : [String : AnyObject]?
    ) {
        dismissViewControllerAnimated(true) {}
        
        if let trip = currentTrip {
            delegate?.detailController(self, changePhotoTo: image, inTrip: trip)
        }

        pictureView.image = image
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController
    ) {
        dismissViewControllerAnimated(true) {}
    }
}
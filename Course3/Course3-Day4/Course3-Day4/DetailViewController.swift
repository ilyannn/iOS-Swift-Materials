//
//  DetailViewController.swift
//  Course3-Day4
//
//  Created by iOS Swift Course on 12/5/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pictureView: UIImageView!
    
    @IBOutlet var tapRecognizer: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
        descriptionLabel.text = trip.tripDescription
        percentLabel.text = " \(trip.hitPercent) % "
        
        pictureView.image = nil
        
        guard let URL = trip.pictureURL else {
            return
        }
        
        pictureView.sd_setImageWithURL(URL)
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
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

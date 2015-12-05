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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

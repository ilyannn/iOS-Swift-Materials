//
//  TripCell.swift
//  Course3-Day4
//
//  Created by iOS Swift Course on 11/29/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

class TripCell: UITableViewCell {

    @IBOutlet weak var tripPicture: UIImageView!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configureWithTrip(trip: Trip) {
        descriptionLabel.text = trip.tripDescription
        percentLabel.text = "\(trip.hitPercent) %"
        
        tripPicture.image = nil

        guard let URL = trip.pictureURL else {
            return
        }
 
        guard let data = NSData(contentsOfURL: URL) else {
            return
        }
        
        tripPicture.image = UIImage(data: data)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        let duration: Double = animated ? 0: 0.25

        let scale: CGFloat = selected ? 1.15 : 1
        let transform1 = CGAffineTransformMakeScale(scale, scale)
        let angle = CGFloat(M_PI) * CGFloat(Int(selected))
        let transform2 = CATransform3DMakeRotation(angle, 0, 1, 0)
        
        UIView.animateWithDuration(duration) {
            
            self.transform = transform1
            self.tripPicture.layer.transform = transform2
        }
        
    }

}

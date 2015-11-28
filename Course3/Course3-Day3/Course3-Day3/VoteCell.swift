//
//  VoteCell.swift
//  Course3-Day3
//
//  Created by iOS Swift Course on 11/28/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

class VoteCell: UITableViewCell {

    @IBOutlet weak var votePicture: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        votePicture.layer.cornerRadius = 10
        votePicture.clipsToBounds = true

        countLabel.text = "123"
        countLabel.textColor = UIColor.blueColor()
        countLabel.layer.shadowColor = UIColor.blackColor().CGColor
        countLabel.layer.shadowOffset = CGSize(width: -1, height: -3)
        countLabel.layer.shadowOpacity = 0.75
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

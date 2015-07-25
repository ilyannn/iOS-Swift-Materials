//
//  PersonCell.swift
//  Live-Day4
//
//  Created by iOS Swift Course on 7/25/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personAvatar: UIImageView!
    @IBOutlet weak var personBadgesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        personNameLabel.text = "Что-то"
        personBadgesLabel.text = "Текст"
        personBadgesLabel.backgroundColor = .redColor()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

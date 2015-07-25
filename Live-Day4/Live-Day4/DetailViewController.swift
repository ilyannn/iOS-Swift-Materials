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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func avatarTapped(sender: AnyObject) {
        
    }

}


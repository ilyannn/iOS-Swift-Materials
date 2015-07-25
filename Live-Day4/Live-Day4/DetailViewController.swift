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


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


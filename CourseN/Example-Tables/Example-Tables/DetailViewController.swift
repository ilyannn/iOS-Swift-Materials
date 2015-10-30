//
//  DetailViewController.swift
//  Example-Tables
//
//  Created by iOS Swift Course on 10/30/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    var detailItem: NSDate? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            loadView()
            if let label = self.detailDescriptionLabel {
                let formatter = NSDateFormatter()
                formatter.dateStyle = .LongStyle
                formatter.timeStyle = .ShortStyle
                label.text = formatter.stringFromDate(detail)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.configureView()
        detailDescriptionLabel.backgroundColor = UIColor.blueColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  DetailViewController.swift
//  Day3-Purchases
//
//  Created by iOS Swift Course on 9/5/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var productLabel: UILabel!

    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var priceLabel: UILabel!
    var detailItem: Purchase? {
        didSet {
            let _ = self.view
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            productLabel.text = detail.name
            view.backgroundColor = detail.color
            priceLabel.text = detail.price.description
            productImageView.image = UIImage(named: detail.name)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


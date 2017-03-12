//
//  ViewController.swift
//  Day5-Scroll
//
//  Created by iOS Swift Course on 1/8/16.
//  Copyright © 2016 iOS Swift Course. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let imageView = UIImageView(image: UIImage(named: "alps.jpg"))
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.addSubview(imageView)
        let π = CGFloat(M_PI)
        var transform = CATransform3DIdentity
        transform.m34 = -0.001
        scrollView.layer.transform = transform
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let size = view.bounds.width
        imageView.frame = CGRect(x: 0, y: 0, width: size * 3, height: scrollView.bounds.height * 3)
        scrollView.contentSize = imageView.bounds.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


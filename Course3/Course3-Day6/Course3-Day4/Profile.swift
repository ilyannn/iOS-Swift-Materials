//
//  Profile.swift
//  Course3-Day6
//
//  Created by iOS Swift Course on 12/6/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

class ProfileViewController : UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollVIew: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var size = scrollVIew.bounds.size
        size.width *= 3
        scrollVIew.contentSize = size
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        pageControl.currentPage = Int(scrollVIew.contentOffset.x / scrollVIew.bounds.size.width)
    }
}
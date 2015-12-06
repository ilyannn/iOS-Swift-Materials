//
//  PageViewController.swift
//  Course3-Day6
//
//  Created by iOS Swift Course on 12/6/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 10
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.greenColor()
        return vc
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.greenColor()
        return vc
    }
}

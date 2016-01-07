//
//  User Interface.swift
//  Day3-Courses
//
//  Created by iOS Swift Course on 1/6/16.
//  Copyright © 2016 iOS Swift Course. All rights reserved.
//

import UIKit

class CourseListViewController: UITableViewController {

    let courseList = getCourses()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return courseList.count
    }
    
//    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return UIView()
//    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CourseCell
        
        let index = indexPath.row
        let course = courseList[index]
        
        cell.courseNameLabel.text = course.courseName
        cell.teacherLabel.text = course.teacherName
    
        loadImage(from: course, into: cell.logoImage)

        return cell
    }
    
    let imageLoadingQueue = NSOperationQueue()
    
    func loadImage(from course:Course, into imageView: UIImageView) {
        
        guard let url = course.logoURL
            else { return }
        
        imageLoadingQueue.addOperationWithBlock {
            
            guard let data = NSData(contentsOfURL: url)
                else { return }
      
            NSOperationQueue.mainQueue().addOperationWithBlock {
                
                imageView.image = UIImage(data: data)
                
            }
        }
    }

}

class CourseCell: UITableViewCell {
    
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var teacherLabel: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        let logo = logoImage
        guard let superview = logoImage.superview as? UIStackView else { return }

        logo.removeFromSuperview()
        superview.insertArrangedSubview(logo, atIndex: 0)
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
    }
}

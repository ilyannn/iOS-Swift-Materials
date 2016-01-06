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
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return courseList.count
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CourseCell
        
        let index = indexPath.row
        let course = courseList[index]
        
        cell.courseNameLabel.text = course.courseName
        cell.teacherLabel.text = course.teacherName
        return cell
    }
}

class CourseCell: UITableViewCell {
    @IBOutlet weak var courseNameLabel: UILabel!
    
    @IBOutlet weak var teacherLabel: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        courseNameLabel.layer.cornerRadius = 10
        courseNameLabel.clipsToBounds = true
    }
}

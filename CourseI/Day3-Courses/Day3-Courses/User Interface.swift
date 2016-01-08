//
//  User Interface.swift
//  Day3-Courses
//
//  Created by iOS Swift Course on 1/6/16.
//  Copyright © 2016 iOS Swift Course. All rights reserved.
//

import UIKit
import SpriteKit

class Ball: UIImageView {
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        return .Ellipse
    }
}

class CourseListViewController: UITableViewController {
    
    let dateFormatter = NSDateFormatter()
    let courseList = getCourses()
    var currentPerson = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .MediumStyle
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return courseList.count
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let button = UIButton(type: .Custom)
        
        button.titleLabel?.font = UIFont.systemFontOfSize(40)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.backgroundColor = UIColor.brownColor()
        button.addTarget(self, action: "editProfile", forControlEvents: .TouchUpInside)
        
        let name = currentPerson.name ?? "Профиль"
        button.setTitle(name, forState: .Normal)

        return button
    }
    
    func editProfile() {
        performSegueWithIdentifier("profile", sender: self)
    }
    
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let vc = segue.destinationViewController
            as? DetailCourseViewController,
           let cell = sender as? CourseCell
        {
            vc.loadViewIfNeeded()
            
            let index = tableView.indexPathForCell(cell)!.row
            let course = courseList[index]
            vc.teacherNameLabel.text = course.teacherName
            vc.courseNameLabel.text = course.courseName

            vc.logoImage.image = cell.logoImage.image
            
            if let date = course.startDate {
                vc.startDateLabel.text = dateFormatter.stringFromDate(date)
            }
        }
    }
}

class DetailCourseViewController: UIViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var teacherNameLabel: UILabel!
    @IBOutlet weak var courseNameLabel: UILabel!
    
    @IBAction func swipeToClose(sender: AnyObject) {        dismissViewControllerAnimated(true, completion: nil)
    }
    
    var gravityAnimator: UIDynamicAnimator?

    @IBAction func moveImage(sender: UITapGestureRecognizer) {

        guard let source = sender.view as? UIImageView else {return}
        let center = source.center
        let size = source.bounds.size
        
        let animator = UIDynamicAnimator(referenceView: view)
        gravityAnimator = animator
        
        let scale = CGFloat(1) / 3

        UIView.animateWithDuration(0.5,
            delay: 0,
            options: [],
            animations: { source.transform = CGAffineTransformMakeScale(scale, scale) }
        ) { _ in
                
                source.removeFromSuperview()
                let ball = Ball(image: source.image)
                
                ball.center = center
                ball.bounds = CGRectMake(0, 0, size.width * scale, size.height * scale)
                
                self.view.addSubview(ball)
                
                let collision = UICollisionBehavior(items: [ball])
                collision.translatesReferenceBoundsIntoBoundary = true

                let dynamic = UIDynamicItemBehavior(items:[ball])
                dynamic.elasticity = 0.9
            
                let gravity = UIGravityBehavior(items: [ball])
                gravity.gravityDirection = CGVector(dx:0.2, dy:1)
            
                animator.addBehavior(gravity)
                animator.addBehavior(collision)
                animator.addBehavior(dynamic)
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

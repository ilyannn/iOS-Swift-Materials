//
//  User Interface.swift
//  Day3-Courses
//
//  Created by iOS Swift Course on 1/6/16.
//  Copyright © 2016 iOS Swift Course. All rights reserved.
//

import UIKit
import SpriteKit
import PASImageView

public class Ball: UIImageView {
    public override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        return .Ellipse
    }
}

class PersonHeader:UIView {

    let headerButton = UIButton(type: .Custom)
    let pictureView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerButton)
        addSubview(pictureView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = bounds.height
        pictureView.bounds = CGRect(x: 0, y: 0, width: size, height: size)
        pictureView.center = CGPoint(x: bounds.width - size/2, y: size/2)
        
        let π = CGFloat(M_PI)
        pictureView.transform = CGAffineTransformMakeRotation(π/2)
        headerButton.bounds = CGRect(x: 0, y: 0, width: bounds.width - size, height: size)
        headerButton.center = CGPoint(x: bounds.midX - size / 2, y: bounds.midY)
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
    
    // tableView(_:viewForHeaderInSection:)
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = PersonHeader()

        let button = header.headerButton

        button.accessibilityIdentifier = "HeaderButton"
        
        button.titleLabel?.font = UIFont.systemFontOfSize(40)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.backgroundColor = UIColor.brownColor()
        button.addTarget(self, action: "editProfile:", forControlEvents: .TouchUpInside)
        
        let name = currentPerson.name ?? "Профиль"
        button.setTitle(name, forState: .Normal)
        
        header.pictureView.image = currentPerson.picture
        return header
    }
    
    func editProfile(sender:AnyObject) {
        performSegueWithIdentifier("profile", sender: self)
    }
    
    // tableView:cellForRowAtIndexPath:
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CourseCell
        
        let index = indexPath.row
        let course = courseList[index]
        
        cell.courseNameLabel.text = course.courseName
        cell.teacherLabel.text = course.teacherName
    
        if let url = course.logoURL {
            cell.logoImage.imageURL(url)
            cell.logoImage.delegate = self
        }
        
        return cell
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        segue.destinationViewController.loadViewIfNeeded()
        
        if let vc = segue.destinationViewController
            as? DetailCourseViewController,
           let cell = sender as? CourseCell
        {
            let index = tableView.indexPathForCell(cell)!.row
            let course = courseList[index]
            vc.teacherNameLabel.text = course.teacherName
            vc.courseNameLabel.text = course.courseName

            _ = course.logoURL.flatMap(vc.logoImage.imageURL)
            
            if let date = course.startDate {
                vc.startDateLabel.text = dateFormatter.stringFromDate(date)
            }
        }
        
        if let vc = segue.destinationViewController
             as? ProfileViewController
        {            
            vc.nameField.text = currentPerson.name
            vc.emailField.text = currentPerson.email
            vc.pictureImageView.image = currentPerson.picture
        }
    }
}

extension CourseListViewController: PASImageViewDelegate {
    func PAImageView(didTapped imageView: PASImageView) {
        
        let logo = imageView
        guard let superview = logo.superview as? UIStackView else { return }
        
        logo.removeFromSuperview()
        superview.insertArrangedSubview(logo, atIndex: 0)
    }
}

class DetailCourseViewController: UIViewController {
    
    @IBOutlet weak var logoImage: PASImageView!
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
    @IBOutlet weak var logoImage: PASImageView!
    @IBOutlet weak var teacherLabel: UILabel!
}

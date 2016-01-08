//
//  Profile.swift
//  Day3-Courses
//
//  Created by iOS Swift Course on 1/8/16.
//  Copyright © 2016 iOS Swift Course. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pictureImageVIew: UIImageView!
}

extension CourseListViewController {

    struct Person {
        
        var name: String? = nil
        var email: String? = nil
        var picture: UIImage? = nil
        
        init() {
            let defaults = NSUserDefaults.standardUserDefaults()
            name = defaults.stringForKey("name")
            email = defaults.stringForKey("email")
        }
        
        func save() {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setValue(name, forKey: "name")
            defaults.setValue(email, forKey: "email")
        }
    }

    @IBAction func unwindToSaveProfile(unwind_segue: UIStoryboardSegue)
    {
        let profile = unwind_segue.sourceViewController as? ProfileViewController
        
        currentPerson.name = profile?.nameField.text
        currentPerson.email = profile?.emailField.text
        currentPerson.picture = profile?.pictureImageVIew.image
        
        currentPerson.save()
        
        tableView.reloadData()
    }
}

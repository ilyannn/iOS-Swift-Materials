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
    @IBOutlet weak var pictureImageView: UIImageView!
    
    
    @IBAction func editPicture(sender: AnyObject) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate
{

    func imagePickerControllerDidCancel(picker: UIImagePickerController)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
        
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        dismissViewControllerAnimated(true, completion: nil)
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage
              else { return }
        
        pictureImageView.image = image
    }
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

            if let data = defaults.dataForKey("pictureData") {
                picture = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? UIImage
            }
        }
        
        func save() {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setValue(name, forKey: "name")
            defaults.setValue(email, forKey: "email")

            if let picture_ = picture {
                let data = NSKeyedArchiver.archivedDataWithRootObject(picture_)
                defaults.setValue(data, forKey: "pictureData")
            }
        }
    }

    @IBAction func unwindToSaveProfile(unwind_segue: UIStoryboardSegue)
    {
        let profile = unwind_segue.sourceViewController as? ProfileViewController
        
        currentPerson.name = profile?.nameField.text
        currentPerson.email = profile?.emailField.text
        currentPerson.picture = profile?.pictureImageView.image
        
        currentPerson.save()
        
        tableView.reloadData()
    }
}

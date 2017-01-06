//
//  SecondViewController.swift
//  HomeSearch
//
//  Created by iOS Swift Course on 1/6/17.
//  Copyright © 2017 iOS Swift Course. All rights reserved.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController
    , UIImagePickerControllerDelegate
    , UINavigationControllerDelegate
{
    
    @IBOutlet weak var explanationText: UILabel!
    
    @IBOutlet weak var profilePicture: UIImageView!

    let container = NSPersistentContainer(name: "HomeSearch")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layer = profilePicture.layer
        layer.borderWidth = 3
        layer.borderColor = UIColor.red.cgColor
        
        let request =  NSFetchRequest<Profile>(entityName: "Profile")
        
        container.loadPersistentStores { _ in }
        
        if let profile = try! container.viewContext.fetch(request).first {
            if let image = UIImage(data: profile.pictureData as! Data) {
                profilePicture.image = image
            }
        }
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        let vc = UIImagePickerController()

        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            vc.sourceType = .camera
        }
        
        vc.delegate   = self
        present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let layer = profilePicture.layer
        layer.cornerRadius = layer.bounds.size.width / 2
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]
    ) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profilePicture.image     = image
            explanationText.isHidden = true
            
            let context = container.viewContext
            let descr = container.managedObjectModel.entities[0]
            let profile = Profile(entity: descr, insertInto: context)
            profile.pictureData = UIImageJPEGRepresentation(image, 0.8) as NSData?
            try? context.save()
        }
        
        dismiss(animated: false, completion: {})
    }
}




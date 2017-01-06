//
//  SecondViewController.swift
//  HomeSearch
//
//  Created by iOS Swift Course on 1/6/17.
//  Copyright © 2017 iOS Swift Course. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController
    , UIImagePickerControllerDelegate
    , UINavigationControllerDelegate
{
    
    @IBOutlet weak var explanationText: UILabel!
    
    @IBOutlet weak var profilePicture: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layer = profilePicture.layer
        layer.borderWidth = 3
        layer.borderColor = UIColor.red.cgColor
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
        }
        
        dismiss(animated: false, completion: {})
    }
}




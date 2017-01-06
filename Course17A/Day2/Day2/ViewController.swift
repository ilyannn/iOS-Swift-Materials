//
//  ViewController.swift
//  Day2
//
//  Created by iOS Swift Course on 1/4/17.
//  Copyright © 2017 iOS Swift Course. All rights reserved.
//

import AVFoundation
import UIKit

struct Person {
    
    let firstName: String
    let lastName:  String
    let role:      String
    let alsoKnown: String?
    let born:      Int
    let photoResource: String? // Optional<String>
    
    func greet() {
        
        let synthesizer = AVSpeechSynthesizer()
        let text = "Hello, \(firstName) \(lastName)"
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Daniel-compact")
        synthesizer.speak(utterance)
    }
    
}

let persons = [
    Person(firstName: "Benedict", lastName: "Cumberbach",
           role:"Sherlock", alsoKnown : "Smaug",
           born: 1976, photoResource: "cumberbach.jpg"
    ),
    Person(firstName: "Martin",   lastName: "Freeman",
           role:"Dr. Watson",  alsoKnown: "Bilbo Baggins",
           born: 1971, photoResource: "freeman.jpg"
    ),
    Person(firstName: "Andrew",   lastName: "Stubbs",
           role:"Jim Moriarty",  alsoKnown: nil,
           born: 1976, photoResource: nil
    ),
    Person(firstName: "Una",   lastName: "Stubbs",
           role:"Mrs. Hudson",  alsoKnown: nil,
           born: 1937, photoResource: nil
    ),
]


class CharacterCell: UITableViewCell {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var alsoKnownLabel: UILabel!
    @IBOutlet weak var personPicture: UIImageView!
    
    @IBOutlet weak var borderedView: UIView!
}

class CharactersViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Actor", for: indexPath) as! CharacterCell
        
        let index  = indexPath.row
        let person = persons[index]
        
        cell.firstNameLabel.text = person.firstName
        cell.lastNameLabel.text  = person.lastName
        
        cell.nicknameLabel.text  = "AS \(person.role)"
        
        let age = 2017 - person.born
        cell.ageLabel.text = "age \(age)"
        
        if let known = person.alsoKnown {
            cell.alsoKnownLabel.text = "'\(known)'"
            cell.alsoKnownLabel.isHidden = false
        } else {
            cell.alsoKnownLabel.isHidden = true
        }
        
        cell.borderedView.layer.cornerRadius = 20
        cell.borderedView.clipsToBounds = true
        
        if let photo = person.photoResource {
            let image = UIImage(named: photo)
            cell.personPicture.image = image
        }
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let vc = segue.destination as! PersonViewController

        vc.loadViewIfNeeded()
        
        if let indexPath = tableView.indexPathForSelectedRow {

            let index  = indexPath.row
            let person = persons[index]
            
            person.greet()
            
            vc.personName.text = person.firstName
            vc.personLastName.text  = person.lastName
            
            if let photo = person.photoResource {
                let image = UIImage(named: photo)
                vc.personPicture.image = image
            }
        }
    }
}

let π = CGFloat(M_PI)

class PersonViewController: UIViewController {
    @IBOutlet weak var personPicture: UIImageView!
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personLastName: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        personPicture.clipsToBounds      = true
        personPicture.layer.cornerRadius = 100
        
        let pl = personLastName.layer
        pl.shadowOffset  = CGSize(width: 3, height: 3)
        pl.shadowOpacity = 1
        
        personPicture.image = UIImage(named: "cumberbach.jpg")
        personName.text     = "Benedict"
        personLastName.text = "Cumberbach"
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var seasonPhoto: UIImageView!
    @IBOutlet weak var charactersButton: UIButton!
    @IBOutlet weak var episodeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        charactersButton.backgroundColor = UIColor.red
        charactersButton.layer.cornerRadius = 20
        
        episodeLabel.alpha = 0.1
        
        UIView.animate(withDuration: 8) {
            self.seasonPhoto.transform = CGAffineTransform(rotationAngle: π/6)
            self.seasonPhoto.alpha  = 0.4
            self.episodeLabel.alpha = 1
            self.episodeLabel.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
        
        seasonPhoto.layer.cornerRadius = 25
        seasonPhoto.clipsToBounds = true
        
        episodeLabel.text = episodeLabel.text?.uppercased()
        
        episodeLabel.layer.shadowColor = UIColor.black.cgColor
        episodeLabel.layer.shadowOpacity = 0.5
        episodeLabel.layer.shadowOffset = CGSize(width: 3, height: 3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


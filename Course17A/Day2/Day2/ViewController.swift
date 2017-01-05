//
//  ViewController.swift
//  Day2
//
//  Created by iOS Swift Course on 1/4/17.
//  Copyright © 2017 iOS Swift Course. All rights reserved.
//

import UIKit

struct Person {
    let firstName: String
    let lastName:  String
    let role:      String
    let alsoKnown:  String
    let born:      Int
    let photoResource: String
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
           role:"Jim Moriarty",  alsoKnown: "",
           born: 1976, photoResource: ""
    ),
    Person(firstName: "Una",   lastName: "Stubbs",
           role:"Mrs. Hudson",  alsoKnown: "",
           born: 1937, photoResource: ""
    ),
]


class CharacterCell: UITableViewCell {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    
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

        return cell
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


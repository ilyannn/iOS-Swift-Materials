//
//  HousesViewController.swift
//  HomeSearch
//
//  Created by iOS Swift Course on 1/7/17.
//  Copyright © 2017 iOS Swift Course. All rights reserved.
//

import UIKit

struct House {
    let pictureURL: String
    let text: String
    let place: String
    let size: Int
    
    init(dict: NSDictionary) {
        pictureURL = dict["picture"] as! String
        text = dict["text"] as! String
        place = dict["place"] as! String
        size = dict["size"] as! Int
    }
}

func LoadHouses() -> [House] {
    if let url = URL(string: "https://raw.githubusercontent.com/ilyannn/iOS-Swift-Materials/master/Course17A/HomeSearch/houses.json")
    {
        do {
            let data  = try Data(contentsOf: url)
            let json  = try JSONSerialization.jsonObject(with: data, options: [])
            
            let array = json as! [NSDictionary]
            
            return array.map { dict in
                House(dict: dict)
            }
        } catch {}
    }
    return []
}


class HouseCell: UITableViewCell {
    @IBOutlet weak var houseDescription: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var housePicture: UIImageView!
}

class HousesViewController: UITableViewController {
    
    let houses = LoadHouses()
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
//    {
//        let view = UIView()
//        view.backgroundColor = UIColor.purple
//        return view
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
//    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.count
    }
    
    let queue = DispatchQueue(label: "com.ilyan.course.houses.images")
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "House", for: indexPath) as! HouseCell

        let house = houses[indexPath.row]
        
        queue.async {
            do {
                if let url   = URL(string: house.pictureURL) {
                    let data  = try Data(contentsOf: url)
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.housePicture.image = image
                    }
                }
            } catch {}
        }
        
        cell.houseDescription.text = house.text
        cell.placeLabel.text = "→ " + house.place
        return cell
    }
}

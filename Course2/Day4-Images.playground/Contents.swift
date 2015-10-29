//: Playground - noun: a place where people can play

import UIKit

let address = "https://cdn0.iconfinder.com/data/icons/online-shopping-3/75/Shopping_icons_vector-04-512.png"

if let url = NSURL(string: address) {
    
    if let imageData = NSData(contentsOfURL: url) {
        let image = UIImage(data: imageData)
    } else {
        
        print("Не получилось  показать картинку")
    }
    
} else {
    
    print("Не получилось, плохой URL")
    
}


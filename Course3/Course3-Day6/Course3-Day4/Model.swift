//
//  Model.swift
//  Course3-Day4
//
//  Created by iOS Swift Course on 12/5/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import Foundation
import UIKit.UIImage

class Trip {
    
    class func loadAndParse(urlString: String) -> [Trip] {
        return parse(urlString)
    }
    
    init(dict: [String: AnyObject]) {
        
        precondition(dict.count > 0)
        
        let hit = dict["hit"] as? Double
        let segments = dict["segments"] as? [String]
        let pictureString = dict["pictureString"] as? String
        
        hitResult = hit ?? 0
        tripSegments = segments ?? []

        if let ratingString = dict["rating"] as? String {
            rating = Double(ratingString)
        } else {
            rating = nil
        }
    
        if let pictureURLString = pictureString {
            pictureURL = NSURL(string: pictureURLString)
        } else {
            pictureURL = nil
        }
        
    }

    let hitResult: Double // 0 to 1
    let tripSegments: [String]
    let pictureURL: NSURL?
    var localImage: UIImage?
    let rating: Double?
    
    var hitPercent: Int {
        return Int(hitResult * 100)
    }
    
    var tripDescription:String {
        return tripSegments.joinWithSeparator(" + ")
    }
    
    
    func configureImageView(imageView: UIImageView) {
        
        if let local = localImage {
            imageView.image = local
            return
        }
        
        guard let URL = pictureURL else {
            return
        }
        
        imageView.sd_setImageWithURL(URL)
    }
}

private func parse(urlString: String) -> [Trip] {
    
    guard let url = NSURL(string: urlString),
        let data = NSData(contentsOfURL: url) else {
            return []
    }
    
    guard let json = try? NSJSONSerialization.JSONObjectWithData(data, options: []) else {
        return []
    }
    
    guard let array = json as? [ [String:AnyObject] ] else {
        return []
    }
    
    return array.map(Trip.init)
}


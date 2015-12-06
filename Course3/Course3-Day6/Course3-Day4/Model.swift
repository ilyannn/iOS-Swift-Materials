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

    let hitResult: Double // 0 to 1
    let tripSegments: [String]
    let pictureURL: NSURL?
    var localImage: UIImage?
    
    var hitPercent: Int {
        return Int(hitResult * 100)
    }
    
    var tripDescription:String {
        return tripSegments.joinWithSeparator(" + ")
    }
    
    init(hit: Double, segments: [String], pictureString string: String? = nil) {
        hitResult = hit
        tripSegments = segments
        
        if let pictureURLString = string {
            pictureURL = NSURL(string: pictureURLString)
        } else {
            pictureURL = nil
        }
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

private func read(dict: [String: AnyObject]) -> Trip {
    
    let hit = dict["hit"] as? Double
    let segments = dict["segments"] as? [String]
    let pictureString = dict["pictureString"] as? String
    
    return Trip(
        hit: hit ?? 0,
        segments: segments ?? [],
        pictureString: pictureString)
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
    
    return array.map(read)
}


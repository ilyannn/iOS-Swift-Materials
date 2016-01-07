//
//  ViewController.swift
//  Day4-AudioPlayer
//
//  Created by iOS Swift Course on 1/7/16.
//  Copyright © 2016 iOS Swift Course. All rights reserved.
//

import UIKit
import AVFoundation

let url = NSBundle.mainBundle().URLForResource("sample", withExtension: "mp3")!

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    let player = AVPlayer(playerItem: AVPlayerItem(URL: url))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func playOrStop(sender: AnyObject) {
    
        if playButton.selected {
            playButton.selected = false
            player.pause()
        } else {
            playButton.selected = true
            player.play()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


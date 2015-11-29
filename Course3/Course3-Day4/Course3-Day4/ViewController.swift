//
//  ViewController.swift
//  Course3-Day4
//
//  Created by iOS Swift Course on 11/29/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit
import SDWebImage

class Trip {
    let hitResult: Double // 0 to 1
    let tripSegments: [String]
    let pictureURL: NSURL?
    
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
}


class ViewController: UIViewController {

    // MARK: - Модель
    
    let tripCollection = [
        Trip(hit: 0.99, segments: ["Тянь-Шань", "Узбекистан", "Озеро"], pictureString: "http://image.tsn.ua/media/images/original/Aug2009/d5398a5e70_147283.jpg"),
        
        Trip(hit: 0.95, segments: ["Кавказ", "Каспий"]),
        
        Trip(hit: 0.75, segments: ["Альпы", "Швейцария", "Часы"]),
        
        Trip(hit: 0.70, segments: ["Коралловый Риф", "Пляж"]),
        
        Trip(hit: 0.66, segments: ["Полет Дедала", "Солнце"]),
        Trip(hit: 0.30, segments: ["Смотреть Телевизор", "Дома"]),        

        Trip(hit: 0.99, segments: ["Тянь-Шань", "Узбекистан", "Озеро"], pictureString: "http://image.tsn.ua/media/images/original/Aug2009/d5398a5e70_147283.jpg"),
        
        Trip(hit: 0.99, segments: ["Тянь-Шань", "Узбекистан", "Озеро"], pictureString: "http://image.tsn.ua/media/images/original/Aug2009/d5398a5e70_147283.jpg"),
        
        Trip(hit: 0.99, segments: ["Тянь-Шань", "Узбекистан", "Озеро"], pictureString: "http://image.tsn.ua/media/images/original/Aug2009/d5398a5e70_147283.jpg"),
        
        Trip(hit: 0.99, segments: ["Тянь-Шань", "Узбекистан", "Озеро"], pictureString: "http://image.tsn.ua/media/images/original/Aug2009/d5398a5e70_147283.jpg"),
        
    ]

    let monthNames = ["ноябре 2015", "декабре 2015", "январе 2016", "феврале 2016"]
    
    // MARK: - Элементы UI
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var periodPicker: UIPickerView!
    @IBOutlet weak var desiredDays: UILabel!
    @IBOutlet weak var desiredDaysStepper: UIStepper!
    @IBOutlet weak var periodSelectionButton: UIButton!
    
    // MARK: - Методы UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        periodPicker.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectionButtonPressed(sender: AnyObject) {

        periodPicker.hidden = !periodPicker.hidden
    }
    
    @IBAction func daysValueChanged(sender: UIStepper) {
        
        let desired = Int(desiredDaysStepper.value)
        desiredDays.text = "\(desired)"
    }
}


// MARK: - Методы UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    
    // numberOfComponentsInPickerView(_)
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    // pickerView(_: numberOfRowsInComponent:)
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return monthNames.count
    }
    
}

// MARK: - Методы UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {

    // pickerView(_: titleForRow: forComponent:)
    func pickerView(pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    ) -> String? {
        
            return monthNames[row]
    }
    
    // pickerView(_: didSelectRow: inComponent:)
    func pickerView(pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int
    ) {
        periodSelectionButton.setTitle(monthNames[row] + " ⬇", forState: .Normal)
        periodPicker.hidden = true
    }
}

// MARK: - Методы UITableViewDataSource
extension ViewController: UITableViewDataSource {

    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return tripCollection.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("Trip") as! TripCell
        let trip = tripCollection[indexPath.row]

        cell.configureWithTrip(trip)
        return cell
    }
}


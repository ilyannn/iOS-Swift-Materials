//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let formatter = NSDateFormatter()

formatter.dateStyle = .LongStyle
formatter.timeStyle = .LongStyle

formatter.stringFromDate(NSDate())

NSCalendar
    .currentCalendar()
    .component(.Minute, fromDate: NSDate())




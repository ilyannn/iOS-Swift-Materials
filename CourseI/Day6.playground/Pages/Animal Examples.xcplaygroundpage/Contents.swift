//: Playground - noun: a place where people can play

import UIKit.UIImage

func TellSomething() -> String {
    return "Hello, world"
}

let cat = Animal(name: "Snowball II")
let dog = Dog(name: "Santa's Little Helper", breed: "Stray Dog")

TellSomething()

dog.talk()
dog.bye()

cat.age
cat.age = 4
cat.birthYear
cat.age

cat.photo = [#Image(imageLiteral: "images.jpeg")#]

let color = [#Color(colorLiteralRed: 1, green: 0, blue: 0, alpha: 1)#]
let color2 = [#Color(colorLiteralRed: 0.501960814, green: 1, blue: 0, alpha: 1)#]

var array1 = [8, 9, 3894, 34, 67]
var array2 = array1

array1.first
array2.last

array1.removeFirst()
array2.removeLast()

array1
array2

import Foundation

struct Meeting {
    let animal: Animal
    var place: String
    var date: NSDate
}

var meeting = Meeting(animal: dog, place: "Park", date: NSDate())
let meeting2 = meeting

meeting.animal
meeting.date = NSDate()
meeting.place = "Garden"
meeting2.place

class MeetingObject {
    let animal: Animal
    var place: String
    var date: NSDate
    
    init(animal: Animal, place: String) {
        self.animal = animal
        self.place = place
        date = NSDate()
    }
}

var meetingObject = MeetingObject(animal: dog, place: "Park")
let meetingObject2 = meetingObject

meetingObject.animal
meetingObject.date = NSDate()
meetingObject.place = "Garden"
meetingObject2.place

meetingObject = MeetingObject(animal: cat, place: "Apartment")

//: Playground - noun: a place where people can play

import UIKit

let π = CGFloat(M_PI)

class X {
    
}

func my_uppercaseString(source: String) -> String {
    return source.uppercaseString
}


my_uppercaseString("kyhjhg")

//: Примеры объектов

5

"строка".uppercaseString

X()

UIView()


//: Расширение

extension Int {
    
    func square(/* как будто у нас есть self: Int */) -> Int {
        return self * self
    }
}

extension UIView {
    
    func area() -> CGFloat {
        return bounds.size.width * bounds.size.height
    }
    
}

5.square()

UIView().area()

let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
view.backgroundColor = UIColor.greenColor()
view

//: UIView - класс
//: view - инстанция класса 
//: backgroundColor - свойство, я его изменяю


//: Свойства

class Person {
    
    let name: String
    let birth_year: Int

    var age: Int {
        return age(ina: 2015)
    }
    
    init(persons_name: String, birth_year: Int) {
        name = persons_name
        self.birth_year = birth_year
    }
    
    func greeting() -> String {
        return "Привет, \(name)!"
    }
    
    func happyBirthday() -> String {
        return "Happy birthday, \(name)! Тебе \(age)"
    }
    
    func age(ina year:Int) -> Int {
        return year - birth_year
    }
}


let Ваня = Person(persons_name: "Ваня", birth_year: 1980)

Ваня.age

Ваня.greeting()
Ваня.happyBirthday()


"😡".characters.count

import Foundation

let str = NSString(string: "😡")

let obj = str as NSObject

let Петя = Person(persons_name: "Петр", birth_year: 1987)
Петя.happyBirthday()
Петя.age

let frame = CGRect(x: 50, y: 50, width: 250, height: 60)
let button = UIButton(frame: frame)

// [button setTitle:@"Кнопка" forState: UIControlStateNormal];
button.setTitle("Кнопка", forState: .Normal)

button.setTitleColor(UIColor.whiteColor(), forState: .Normal)

// [button setBackgroundColor: ... ] в Objective-C
button.backgroundColor = UIColor.blueColor()
button.layer.cornerRadius = 15
button.alpha = 0.3

button


"π".uppercaseString

button.subviews

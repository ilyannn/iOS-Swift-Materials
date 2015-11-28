//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let names = ["Илья", "Вася", "Павел"]
Array(str.characters)

names.count

// Подсчитаем количество букв в x
func подсчитаем(x:String) -> Int {
    return x.characters.count
}

// Применим к массиву 
names.map(подсчитаем)

names.sort()
names + ["Петя"]

//: ## Объектно-ориентированное программирование
//: Понятие класса

func CurrentYear() -> Int {
    return 2015
}

class Person {
    
    // Свойства (имена внутри класса)
    
    // Неизменяемые
    let firstName: String
    let lastName: String
    let fullName: String
    let birthYear: Int
    
    // Рассчитываемые
    var age: Int { return CurrentYear() - birthYear }
    
    // Изменяемые
    var picture: UIImage?
 
    // Конструкторы = инициализаторы
    init(firstName: String, lastName: String, born: Int) {
        self.firstName = firstName
        self.lastName = lastName
        fullName = firstName + " " + lastName
        birthYear = born
    }
    
    convenience init(fullName: String, born: Int) {
        let splits = fullName.characters.split(" ")

        self.init(firstName: String(splits.first!),
            lastName: String(splits.last!),
            born: born)
    }
    
    // Методы (функция внутри класса)
    func greet(formally formal: Bool) -> String {
        if formal {
            return "Добрый день, \(fullName)"
        } else {
            return "Привет, \(firstName)"
        }
    }

    // в obj-c [object greetFormally: true]
    func greetFormally(formal: Bool) -> String {
        if formal {
            return "Добрый день, \(fullName)"
        } else {
            return "Привет, \(firstName)"
        }
    }
    
    func doSomething() -> Void {
        // do something
    }
    
}

class Student: Person {
    var homework: [String] = []
}

class Teacher: Person {
    var homepage: NSURL?
}

let student1 = Student(firstName: "Snowball", lastName: "II", born:  2011)
let student2 = Student(firstName: "Вася", lastName: "Иванов", born: 1990)
let student3 = Student(fullName: "John Maynard Keynes", born: 1883)

student2.greetFormally(true)
student2.greet(formally: true)
student2.greet(formally: false)

student2.age
student2.age

let x = Student(firstName: "x", lastName: "y", born: 2000)
x.age

student1
student1.picture = UIImage(named: "cat.jpg")

student1.picture


student2

student3

let ilya = Teacher(fullName: "Ilya Nikokoshev", born: 1983)
ilya.birthYear
ilya.age
ilya.homepage = NSURL(string: "https://github.com/ilyannn/iOS-Swift-Materials/tree/master/Course3")

class Course {
    let courseName = "iOS Swift"
    let teacher = ilya
    var students = [student1, student2]
}

let swift = Course()
swift.courseName
swift.students

//: Core Graphics 

let height:CGFloat = 300.0
let width:CGFloat = 500.0

let size = CGSize(width: width, height: height)

let point = CGPoint(x: 5, y: 10)

CGRect(origin: point, size: size)

UIColor(red: 0.5, green: 1, blue: 0, alpha: 1).CGColor


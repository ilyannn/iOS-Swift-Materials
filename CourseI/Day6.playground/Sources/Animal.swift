import Foundation
import UIKit.UIImage

public class Animal {
    
    private let animalName: String
    
    public var birthYear: Int
    
    public var age: Int { get {
        return 2016 - birthYear
    } set {
        birthYear = 2016 - newValue
    }}
    
    public var photo: UIImage?
    
    public init(name: String) {
        animalName = name
        birthYear = 2006
        print(talk())
    }
    
    public func talk() -> String {
        return "Hi, I'm \(animalName)"
    }
    
    public func bye() -> String {
        return "Goodbye!"
    }
}

public class Dog: Animal {
    
    var dogBreed: String
    
    public init(name: String, breed: String) {
        dogBreed = breed
        super.init(name: name)
    }
    
    override public func talk() -> String {
        return "Woof, I'm \(animalName) of \(dogBreed)"
    }
    
}

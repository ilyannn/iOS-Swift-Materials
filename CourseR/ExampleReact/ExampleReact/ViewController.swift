//
//  ViewController.swift
//  ExampleReact
//
//  Created by iOS Swift Course on 12/11/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

class Post: NSObject {
    
}

protocol UserInterfaceFacade {
    func start(coordinator: Coordinator)
}

#if DEBUG
protocol Query {
    
}
#endif

struct ModelQuery: Query {
    let model: Post
    
}

class NetworkCenter {
    
}

class Coordinator: NSOperation {
    var networkAPI:EditPostCoordinatorAPIProtocol?
    weak var coordinatorFacade: UserInterfaceFacade?
}

class MasterCoordinator : Coordinator {

}

class Person {
    var personName: String?
    var birthDate: NSDate?
}

struct PersonNameViewModel {
    var label: UILabel
    var person: Person?
    
    var age: Int { return 10 }
    
    func bind(to person: Person) {
        // при изменении person
        label.text = "Ему \(age) лет"
        //
    }
}

protocol EditPostCoordinatorAPIProtocol {
    
}

class EditPostCoordinator: Coordinator {

    let editingPost: Post
    
    var signedByEditor: Person?
    var personName: String?
    
    var currentPerson: Person!
    
    let personNameViewModel:PersonNameViewModel

    init(post: Post, vc: ViewController//, api: EditPostCoordinatorAPIProtocol
        )
        {
        
        editingPost = post
        personNameViewModel = PersonNameViewModel(label: vc.myLabel, person: nil)
//        networkAPI = api
        
        super.init()

        personNameViewModel.bind(to: currentPerson)
    }
    
    func f() {
        
        let _ = editingPost
        let _ = signedByEditor
        personName = "Петя"
        
        coordinatorFacade?.start(Coordinator())
    }
    
    //        let nameChange = api.nameChangeSignal(textField.text)
    var userHasPermission = false
}

extension EditPostCoordinator: EditViewControllerDelegate {

    func userRequestsNameChange(newName: String) {

        if newName != "" && userHasPermission {
            
        }
        
    }
}

class NetworkAPI: EditPostCoordinatorAPIProtocol {
    
}

import CoreData

class Database {
    var context: NSManagedObject? = nil
}

class CoordinatorCenter: UserInterfaceFacade {

    let networkAPI = NetworkAPI()
    let database = Database()
    
    func start(coordinator: Coordinator) {

        coordinator.coordinatorFacade = self
        coordinator.networkAPI = networkAPI
        coordinator.start()
    }
    
}



// -------------- NetworkAPI.swift ---------------

class NameUpdateSignal {}

protocol NetworkAPI__ {
    func signalForNameUpdate(person:Person, newName: String) -> NameUpdateSignal
}




// -------------- View Controller.swift ---------------

protocol EditViewControllerDelegate {
    
    func userRequestsNameChange(newName: String)
    
    //         database.performTransaction { person.name = ...; name.save() }
}

@objc(EPViewController)
class ViewController: UIViewController, UITextFieldDelegate {

    struct Constants {
         static var ImageDistance: Int { return 56 }
    }
    
    private weak var myLabel: UILabel!

    func displayNewName(string: String) {
        
    }
    
    @objc(updatePersonWithName:)
    func updatePerson(name new: String) {

        let count = new.characters.count
        let utf16count = new.utf16.count

        var some_subview:UIView = UIButton()

        if (count != utf16count) {
            
        }
        
        {(label:UILabel, inout subview: UIView) in
            
            UILabel.addSubview(label)(subview)
            subview = UILabel()
            
        }(myLabel, &some_subview)
        
    }
    
    func updatePerson(photo newval: UIImage) {
        newval
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

    }
    
    var delegate: EditViewControllerDelegate?
    
    public func textFieldDidEndEditing(textField: UITextField) {
        delegate?.userRequestsNameChange(textField.text ?? "")
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

}

class TestExample {
    func example() -> Int {
        
        return 42
    }
}

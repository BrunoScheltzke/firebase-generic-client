//
//  CreatePetViewController.swift
//  ApiClient
//
//  Created by Bruno Scheltzke on 2018-01-11.
//  Copyright © 2018 Bruno Scheltzke. All rights reserved.
//

import UIKit

class CreatePetViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var petTypeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addHideKeyboardOnTouch()
    }
    
    @IBAction func doneButtonClicked(_ sender: Any) {
        guard let name = nameTextField.text else {
            return
        }
        
        guard let textAge = ageTextField.text else {
            return
        }
        
        guard let petType = petTypeTextField.text else {
            return
        }
        
        guard let age = Int(textAge) else {
            return
        }
        
        var pet = Pet()
        pet.name = name
        pet.age = age
        pet.petType = petType
        
        PetManager.shared.save(&pet) { (result) in
            if case .success(_) = result {
                LoginManager.shared.currentUser.pets.append(pet)
                PersonManager.shared.save(&LoginManager.shared.currentUser, completion: { (result) in
                    self.navigationController?.popViewController(animated: true)
                })
            }
        }
    }
}

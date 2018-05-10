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
    
    var isNewPet = true
    var pet = Pet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addHideKeyboardOnTouch()
        
        if !isNewPet {
            setupExistingPet()
        } else {
            navigationItem.title = "Create a new Pet"
        }
    }
    
    func setupExistingPet() {
        nameTextField.text = pet.name
        ageTextField.text = "\(pet.age)"
        petTypeTextField.text = pet.petType
        
        navigationItem.title = "Edit \(pet.name)'s info"
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
        
        pet.name = name
        pet.age = age
        pet.petType = petType

        //TODO: REMOVE COMMENTS
//        PetManager.shared.save(&pet) { (result) in
//            if case .success(_) = result {
//                if self.isNewPet {
//                    LoginManager.shared.currentUser.pets.append(self.pet)
//                    PersonManager.shared.save(&LoginManager.shared.currentUser, completion: { (result) in
//                        self.navigationController?.popViewController(animated: true)
//                    })
//                } else {
//                    self.navigationController?.popViewController(animated: true)
//                }
//            }
//        }
    }
}

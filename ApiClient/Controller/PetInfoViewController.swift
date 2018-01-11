//
//  PetInfoViewController.swift
//  ApiClient
//
//  Created by Bruno Scheltzke on 2018-01-11.
//  Copyright © 2018 Bruno Scheltzke. All rights reserved.
//

import UIKit

class PetInfoViewController: UITableViewController {
    var pet: Pet!
    
    var editPetSegueIdentifier = "editPetSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        PetManager.shared.ifNeeded(pet) { (result) in
            if case .error(let error) = result {
                print(error)
            } else {
                self.setupPetInfo()
            }
        }
    }
    
    @IBAction func editButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: editPetSegueIdentifier, sender: pet)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CreatePetViewController, let pet = sender as? Pet {
           destination.isNewPet = false
            destination.pet = pet
        }
    }
    
    func setupPetInfo() {
        navigationItem.title = "\(pet.name)'s info"
        
        DispatchQueue.main.async {
            let nameCell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
            nameCell?.detailTextLabel?.text = self.pet.name
            let ageCell = self.tableView.cellForRow(at: IndexPath(row: 1, section: 0))
            ageCell?.detailTextLabel?.text = "\(self.pet.age)"
            let petTypeCell = self.tableView.cellForRow(at: IndexPath(row: 2, section: 0))
            petTypeCell?.detailTextLabel?.text = self.pet.petType
        }
    }
}

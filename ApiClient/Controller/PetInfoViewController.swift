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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "\(pet.name)'s info"
        
        setupPetInfo()
    }
    
    func setupPetInfo() {
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

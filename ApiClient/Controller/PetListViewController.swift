//
//  PetListViewController.swift
//  ApiClient
//
//  Created by Bruno Scheltzke on 2018-01-10.
//  Copyright © 2018 Bruno Scheltzke. All rights reserved.
//

import UIKit

class PetListViewController: UIViewController {

    @IBOutlet weak var tableOfPets: UITableView!
    let reusableCell = "petCell"
    
    let petInfoSegue = "petInfoSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableOfPets.delegate = self
        tableOfPets.dataSource = self
        
        //this should be a decent login, ignore it :)
        LoginManager.shared.login { () in
            DispatchQueue.main.async {
                self.tableOfPets.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PetInfoViewController, let pet = sender as? Pet {
            destination.pet = pet
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableOfPets.reloadData()
    }
}

extension PetListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LoginManager.shared.currentUser.pets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableOfPets.dequeueReusableCell(withIdentifier: reusableCell)!
        
        cell.detailTextLabel?.text = LoginManager.shared.currentUser.pets[indexPath.row].firebaseId
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //TODO: REMOVE COMMENTS
            PetManager.shared.remove(LoginManager.shared.currentUser.pets[indexPath.row], completion: nil)
            LoginManager.shared.currentUser.pets.remove(at: indexPath.row)
            PersonManager.shared.save(&LoginManager.shared.currentUser, completion: nil)
            
            tableOfPets.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension PetListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pet = LoginManager.shared.currentUser.pets[indexPath.row]
        performSegue(withIdentifier: petInfoSegue, sender: pet)
    }
}

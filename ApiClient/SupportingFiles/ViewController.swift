//
//  ViewController.swift
//  ApiClient
//
//  Created by Bruno Scheltzke on 2017-12-14.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bruno = Person(name: "Bruno", lastName: "Scheltzke")
        let fido = Dog(name: "Fido")
        
        bruno.dog = fido
        
        DogManager.shared.save(fido) { (result) in
            if case .success(_) = result {
                PersonManager.shared.save(bruno) { (result) in
                    if case .success(_) = result {
                        PersonManager.shared.fetch(byId: bruno.firebaseId, completion: { (result) in
                            if case .success(let personFetched) = result {
                                DogManager.shared.ifNeeded(model: personFetched.dog, completion: { (result) in
                                    if case .success(_) = result {
                                        print(personFetched.dog.name)
                                    }
                                })
                            }
                        })
                    }
                }
            }
        }
    }
}

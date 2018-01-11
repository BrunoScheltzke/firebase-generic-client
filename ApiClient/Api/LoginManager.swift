//
//  LoginManager.swift
//  ApiClient
//
//  Created by Bruno Scheltzke on 2018-01-11.
//  Copyright © 2018 Bruno Scheltzke. All rights reserved.
//

import Foundation

class LoginManager {
    static let shared = LoginManager()
    
    var currentUser: Person = Person()
    
    func login(completion: @escaping (Result<Person?>) -> Void) {
        currentUser.firebaseId = "-L2_tYi3OLfrZW9eTCa7"
        
        //this should be a decent login, ignore it :)
        PersonManager.shared.ifNeeded(currentUser) { (result) in
            completion(result)
        }
    }
}

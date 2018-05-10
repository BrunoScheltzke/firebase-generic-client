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
    
    //TODO: Add result to completion parameter
    func login(completion: @escaping () -> Void) {
        currentUser.firebaseId = "id-generation-should-be-firebases-job"
        
        //this should be a decent login, ignore it :)
//        PersonManager.shared.fetch(byId: "id-generation-should-be-firebases-job") { (result) in
//            switch result {
//            case .success(let personFetched):
//                self.currentUser = personFetched
//                completion(.success(()))
//            case .error(let error):
//                if case ManagerError.notFound(_) = error {
//                    self.currentUser.name = "Will"
//                    self.currentUser.lastName = "Smith"
//
//                    PersonManager.shared.save(&self.currentUser, completion: { (result) in
//                        completion(result)
//                    })
//                } else {
//                    completion(.error(error))
//                }
//            }
//        }
    }
}

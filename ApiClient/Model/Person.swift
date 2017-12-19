//
//  Person.swift
//  ApiClient
//
//  Created by Bruno Scheltzke on 2017-12-18.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import Foundation

struct Person: FirebaseFetchable {
    // sourcery: ignore
    var firebaseId: String? = ""
    // sourcery: ignore
    var isCompleted: Bool = false
    var name: String = ""
    var lastName: String = ""
    
    init(name: String, lastName: String) {
        self.name = name
        self.lastName = lastName
    }
    
    init() {
        
    }
}

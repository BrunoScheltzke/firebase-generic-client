//
//  Dog.swift
//  ApiClient
//
//  Created by Bruno Scheltzke on 2017-12-21.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import Foundation

final class Dog: FirebaseFetchable {
    // sourcery: ignore
    var firebaseId: String = ""
    // sourcery: ignore
    var isCompleted: Bool = false
    var name: String = ""
    
    init(name: String) {
        self.name = name
    }
    
    init() {}
}

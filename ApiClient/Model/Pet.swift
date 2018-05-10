//
//  Pet.swift
//  ApiClient
//
//  Created by Bruno Scheltzke on 2018-01-10.
//  Copyright © 2018 Bruno Scheltzke. All rights reserved.
//

import Foundation

//TODO: CONFORM CLASS WITH FirebaseFetchable
final class Pet {
    // sourcery: ignore
    var firebaseId: String = ""
    // sourcery: ignore
    var isCompleted: Bool = false
    var name: String = ""
    var age: Int = Int()
    var petType: String = ""
    
    init() {}
}

//
//  Person.swift
//  ApiClient
//
//  Created by Bruno Scheltzke on 2017-12-18.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import Foundation

//TODO: CONFORM CLASS WITH FirebaseFetchable

final class Person {
    // sourcery: ignore
    var firebaseId: String = ""
    // sourcery: ignore
    var isCompleted: Bool = false
    var name: String = ""
    var lastName: String = ""
    var pets: [Pet] = [Pet]()
    
    init() {}
}

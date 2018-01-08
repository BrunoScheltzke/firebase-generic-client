//
//  PetShop.swift
//  ApiClient
//
//  Created by Bruno Scheltzke on 2017-12-23.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import Foundation

struct PetShop: FirebaseFetchable {
    // sourcery: ignore
    var firebaseId: String
    // sourcery: ignore
    var isCompleted: Bool
    var name: String
    var clients: [Person]
}

//
//  Fetchable.swift
//  ApiClient
//
//  Created by Bruno Scheltzke on 2017-12-18.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import Foundation

protocol FirebaseFetchable {
    var firebaseId: String { get set }
    var isCompleted: Bool { get set }
}

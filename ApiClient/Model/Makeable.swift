//
//  Makeable.swift
//  ApiClient
//
//  Created by Bruno Scheltzke on 2017-12-19.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import Foundation

protocol Makeable: class {
    func toDictionary() -> [String: Any]
    static func make(from dictionary: [String: Any]) -> Self
}

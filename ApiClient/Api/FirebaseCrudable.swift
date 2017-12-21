//
//  FirebaseCrudable.swift
//  ApiClient
//
//  Created by Bruno Scheltzke on 2017-12-21.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import Foundation
import FirebaseDatabase

enum Result<T> {
    case success(T)
    case error(Error)
}

typealias FirebaseModel = FirebaseFetchable & Makeable

protocol FirebaseCrudable {
    associatedtype Model: FirebaseModel
    
    var ref: DatabaseReference! { get }
    var tableName: String { get }
    
    func save(_ model: Model, completion: @escaping (Result<Void>) -> Void?)
    func fetch(byId id: String, completion: @escaping(Result<Model>) -> Void)
    func map(model: Model) -> [String: Any]
}

extension FirebaseCrudable {
    var ref: DatabaseReference {
        return Database.database().reference()
    }
    
    var tableName: String {
        return String(describing: Model.self)
    }
    
    func map(model: Model) -> [String: Any] {
        if model.firebaseId == "" {
            let child = ref.child(tableName).childByAutoId()
            model.firebaseId = child.key
        }
        
        return ["\(tableName)/\(model.firebaseId)": model.toDictionary()]
    }
    
    func save(_ model: Model, completion: @escaping (Result<Void>) -> Void?) {
        ref.updateChildValues(map(model: model)) { (error, _) in
            guard error == nil else {
                completion(.error(error!))
                return
            }
            completion(.success(()))
        }
    }
    
    func fetch(byId id: String, completion: @escaping(Result<Model>) -> Void) {
        
    }
}

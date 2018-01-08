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
    
    var ref: DatabaseReference { get }
    var tableName: String { get }
    
    func save(_ model: inout Model, completion: ((Result<Void>) -> Void)?)
    func fetch(byId id: String, completion: @escaping(Result<Model>) -> Void)
    func ifNeeded(_ model: Model, completion: @escaping (Result<Model?>) -> Void)
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
        return ["\(tableName)/\(model.firebaseId)": model.toDictionary()]
    }
    
    func save(_ model: inout Model, completion: ((Result<Void>) -> Void)?) {
        if model.firebaseId == "" {
            let child = ref.child(tableName).childByAutoId()
            model.firebaseId = child.key
        }
        
        ref.updateChildValues(map(model: model)) { (error, _) in
            guard error == nil else {
                completion?(.error(error!))
                return
            }
            completion?(.success(()))
        }
    }
    
    func fetch(byId id: String, completion: @escaping(Result<Model>) -> Void) {
        ref.child(tableName).child(id).observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.hasChildren(){
                let dict = self.convertToDictionary(fromDataSnapshot: snapshot)
                let model = Model.make(from: dict)
                completion(.success(model))
            } else {
                completion(.error(ManagerError.notFound("No value found from \(id) tableName: \(self.tableName)")))
            }
        }) { (error) in
            completion(.error(error))
        }
    }
    
    func ifNeeded(_ model: Model, completion: @escaping (Result<Model?>) -> Void) {
        guard !model.isCompleted else {
            completion(.success(nil))
            return
        }
        fetch(byId: model.firebaseId) { (result) in
            switch result {
            case .error(let error):
                completion(.error(error))
            case .success(let fetchedModel):
                completion(.success(fetchedModel))
            }
        }
    }
    
    func convertToDictionary(fromDataSnapshot dataSnapshot: DataSnapshot?) -> [String: Any] {
        guard let snapshot = dataSnapshot else{
            return [:]
        }
        
        var dictionary = snapshot.value as? [String: Any] ?? [:]
        dictionary["firebaseId"] = snapshot.key
        
        return dictionary
    }
}

enum ManagerError: Error{
    case notFound(String)
    
    var localizedDescription: String {
        switch self {
        case .notFound(let message):
            return message
        }
    }
}

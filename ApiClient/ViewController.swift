//
//  ViewController.swift
//  ApiClient
//
//  Created by Bruno Scheltzke on 2017-12-14.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bruno = Person(name: "Bruno", lastName: "Scheltzke")
        let brunoDict = bruno.toDictionary()
        let brunoMadeFromDict = Person.make(from: brunoDict)
        
        print(bruno)
        print(brunoDict)
        print(brunoMadeFromDict)
    }
}

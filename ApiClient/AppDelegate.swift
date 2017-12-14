//
//  AppDelegate.swift
//  ApiClient
//
//  Created by Bruno Scheltzke on 2017-12-14.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}


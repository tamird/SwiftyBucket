//
//  AppDelegate.swift
//  SwiftyBucket
//
//  Created by Tamir Duberstein on 4/11/16.
//  Copyright © 2016 Tamir Duberstein. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            window.backgroundColor = UIColor.white
            window.rootViewController = ViewController()
            window.makeKeyAndVisible()
        }
        return true
    }
}


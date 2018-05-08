//
//  AppDelegate.swift
//  ITPS
//
//  Created by Weslie on 2018/5/8.
//  Copyright © 2018 Weslie. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        /// Set Tab bar appearance
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.2862745098, green: 0.5647058824, blue: 0.8862745098, alpha: 1)

        return true
    }

}


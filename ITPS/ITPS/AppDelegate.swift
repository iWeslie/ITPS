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
    
    var isLogin = false

    var window: UIWindow?
    
    override init() {
        super.init()
        UIViewController.classInit
    }
    
    /// Main Interface 
    private var mainInterface: UIViewController? {
        
        let login = UIStoryboard.init(name: "Login", bundle: nil).instantiateInitialViewController()
        let home = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController()
        
        return isLogin ? home : login
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        /// Set Tab bar appearance
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.2862745098, green: 0.5647058824, blue: 0.8862745098, alpha: 1)
        
        /// Check if is first launch
        if UserDefaults.standard.bool(forKey: "everLaunched") == false {
            UserDefaults.standard.set(true, forKey: "everLaunched")
            UserDefaults.standard.set(true, forKey: "firstLaunch")
        } else {
            UserDefaults.standard.set(false, forKey: "everLaunched")
        }
        
        /// Set home module cells
        if UserDefaults.standard.array(forKey: "homeModule") == nil {
            let defaultArray = Array.init(repeating: true, count: 7)
            UserDefaults.standard.set(defaultArray, forKey: "homeModule")
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = mainInterface
        window?.makeKeyAndVisible()
        

        return true
    }

}


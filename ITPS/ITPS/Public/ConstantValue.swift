/*:
 * ConstantValue.swift
 * Created by Weslie
 * Copyright © 2017 Weslie. All rights reserved.
 */

import UIKit

/// UI Screen bounds width
public let screenWidth = UIScreen.main.bounds.width
/// UI Screen bounds height
public let screenHeight = UIScreen.main.bounds.height

public let screenRect = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)

/// Local version of the App
public let localVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String

/// A bool value return wheather the deviec is iPhoneX
public let isIPHONEX: Bool = { () -> Bool in
    if screenHeight == 812.0 && screenWidth == 375.0 {
        return true
    } else {
        return false
    }
}()

/// A bool value return wheather the deviec is iPhoneSE
public let isIPHONE_SE: Bool = { () -> Bool in
    if screenHeight == 568.0 && screenWidth == 320.0 {
        return true
    } else {
        return false
    }
}()

/// Judge whether the app is first launch or not
public var isFirstLaunch: Bool = { () -> Bool in
    return UserDefaults.standard.bool(forKey: "firstLaunch")
}()

/// Public var to access UserDefaults
public var access_token = UserDefaults.standard.string(forKey: "token")

///// User defaults enum
//public enum UserDefaultsKeyEnum: String {
//    /// String
//    case token = "token"
//    /// Bool
//    case everLaunched = "everLaunched"
//    /// Bool
//    case firstLaunch = "firstLaunch"
//    /// [Bool]
//    case homeModule = "homeModule"
//
//}


//
//  HomeCustomizeModuleViewController.swift
//  ITPS
//
//  Created by Weslie on 2018/5/9.
//  Copyright © 2018 Weslie. All rights reserved.
//

import UIKit

class HomeCustomizeModuleViewController: UIViewController {
    
    @IBOutlet var checkBoxImgCollcetion: [UIImageView]!
    @IBOutlet var moduleBtnCollection: [CustomizeModuleButton]!
    
    private var userDefaultsArray = [Bool]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let moduleArray = UserDefaults.standard.array(forKey: "homeModule") as? [Bool]
        
        precondition(moduleArray != nil, "init userDafault array failed")
        userDefaultsArray = moduleArray!
        
        /// set check box state
        for i in 0..<checkBoxImgCollcetion.count {
            /// set check box state
            checkBoxImgCollcetion[i].isHidden = !userDefaultsArray[i]
            /// set module button select state
            moduleBtnCollection[i].isSelected = userDefaultsArray[i]
        }

    }

    @IBAction func customMoudleBtnClicked(_ sender: CustomizeModuleButton) {
        let tag = sender.moduleTag

        /// update button select status
        sender.isSelected = !sender.isSelected
        /// update temp array
        userDefaultsArray[tag] = sender.isSelected
        /// update check box
        checkBoxImgCollcetion[tag].isHidden = !sender.isSelected
        
        /// update user defaults
        UserDefaults.standard.set(userDefaultsArray, forKey: "homeModule")
        
    }
}

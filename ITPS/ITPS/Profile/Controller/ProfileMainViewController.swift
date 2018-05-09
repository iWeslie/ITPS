//
//  ProfileMainViewController.swift
//  ITPS
//
//  Created by Weslie on 2018/5/9.
//  Copyright © 2018 Weslie. All rights reserved.
//

import UIKit

class ProfileMainViewController: UIViewController {

    @IBOutlet weak var profileAvatarImg: RoundRectImage!
    @IBOutlet weak var profileNameLbl: UILabel!
    @IBOutlet weak var profileAccountLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logOutBtnClicked(_ sender: UIButton) {
        /// Log out and erase user login data
        presentAlertAction(hint: "确定要退出登录吗?") {
            print("...")
        }
        
    }
    
    /// Load profile info
    func loadProfileMainInfo() {
        
    }

}

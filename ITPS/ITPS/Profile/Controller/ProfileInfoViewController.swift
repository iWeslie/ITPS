//
//  ProfileInfoViewController.swift
//  ITPS
//
//  Created by Weslie on 2018/5/9.
//  Copyright © 2018 Weslie. All rights reserved.
//

import UIKit

class ProfileInfoViewController: UIViewController {

    @IBOutlet weak var avatarSmallImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var accountLbl: UILabel!
    
    /// Select avatar
    @IBAction func avatarClicked(_ sender: UIButton) {
    }
    /// Change user name
    @IBAction func nameClicked(_ sender: UIButton) {
        presentAlertInputView(title: "姓名") { (name) in
            self.nameLbl.text = name
        }
    }
    /// Change account
    @IBAction func accountClicked(_ sender: UIButton) {
        presentAlertInputView(title: "账号") { (account) in
            self.accountLbl.text = account
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

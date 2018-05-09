//
//  PublishAnnouncementViewController.swift
//  ITPS
//
//  Created by Weslie on 2018/5/9.
//  Copyright © 2018 Weslie. All rights reserved.
//

import UIKit

let removePublishCoverViewNotification = "com.ITPS.publish.covervView.remove"

class PublishAnnouncementViewController: UIViewController {

    @IBAction func cancelBtnClicked(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
        /// notify tab bar to remove cover view 
        NotificationCenter.default.post(Notification.init(name: Notification.Name.init(removePublishCoverViewNotification), object: nil, userInfo: nil))
    }
    @IBOutlet weak var attachmentViewHCons: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !isIPHONEX { attachmentViewHCons.constant -= 34 }

    }
    
    @IBAction func publishBtnClicked(_ sender: UIBarButtonItem) {
        
    }
    
}

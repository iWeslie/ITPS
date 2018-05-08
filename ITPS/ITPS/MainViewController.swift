//
//  MainViewController.swift
//  ITPS
//
//  Created by Weslie on 2018/5/8.
//  Copyright © 2018 Weslie. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self

    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is OperationViewController {
            /// Add a cover view to the current view and do not switch view controller
            addCoverView()
            return false
        } else {
            return true
        }
    }
    
    func addCoverView() {
        let coverView = Bundle.main.loadNibNamed("PublishAnnouncementCoverView", owner: nil, options: nil)?.first as! PublishAnnouncementCoverView
        coverView.frame = self.view.frame
        
        self.view.addSubview(coverView)
    }

}

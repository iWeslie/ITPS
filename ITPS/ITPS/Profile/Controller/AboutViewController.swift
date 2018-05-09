//
//  AboutViewController.swift
//  ITPS
//
//  Created by Weslie on 2018/5/9.
//  Copyright © 2018 Weslie. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var versionLbl: UILabel!
    @IBOutlet weak var versionSmallLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        versionLbl.text = "V\(localVersion)"

    }

}

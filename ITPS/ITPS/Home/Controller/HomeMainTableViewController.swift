//
//  HomeMainTableViewController.swift
//  ITPS
//
//  Created by Weslie on 2018/5/8.
//  Copyright © 2018 Weslie. All rights reserved.
//

import UIKit

class HomeMainTableViewController: UITableViewController {
    
    @IBOutlet var cellCollcetion: [UITableViewCell]!
    
    private var userDefaultsArray = [Bool]()
    
    var visibleCellArray = [UITableViewCell]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let moduleArray = UserDefaults.standard.array(forKey: "homeModule") as? [Bool]
        precondition(moduleArray != nil, "init userDafault array failed")
        /// update user default array
        userDefaultsArray = moduleArray!
        
        /// remove cells array reload
        visibleCellArray.removeAll()
        /// add cells to data source
        for i in 0..<userDefaultsArray.count {
            if userDefaultsArray[i] == true {
                visibleCellArray.append(cellCollcetion[i])
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visibleCellArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return visibleCellArray[indexPath.row]
    }
    
}

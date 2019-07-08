//
//  TableViewController.swift
//  Project-Prep
//
//  Created by MAC Consultant on 7/7/19.
//  Copyright © 2019 MAC Consultant. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var books: [Items] = []

    @IBOutlet weak var tableViewOne: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell...
        
        return cell
    }}

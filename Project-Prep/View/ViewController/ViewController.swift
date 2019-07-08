//
//  ViewController.swift
//  Project-Prep
//
//  Created by MAC Consultant on 7/7/19.
//  Copyright © 2019 MAC Consultant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var CollectionView: UICollectionView!
    
    var books: [Items] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let TableNib = UINib(nibName: "TableViewCell", bundle: nil)
        let CollectionNib = UINib(nibName: "CollectionViewCell", bundle: nil)
        TableView.register(TableNib, forCellReuseIdentifier: "tableViewCell")
        CollectionView.register(CollectionNib, forCellWithReuseIdentifier: "collectionViewCell")
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func switchAction(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            firstView.alpha = 1
            secondView.alpha = 0
            TableView.reloadData()
        } else {
            firstView.alpha = 0
            secondView.alpha = 1
            CollectionView.reloadData()
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        cell.customInit(textOne: books[0].volumeInfo[0].title, textTwo: books[0].volumeInfo[0].authors[0], textThree: books[0].volumeInfo[0].publisher, textFour: books[0].volumeInfo[0].publishDate)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        cell.customInit(textOne: books[0].volumeInfo[0].title, textTwo: books[0].volumeInfo[0].authors[0], textThree: books[0].volumeInfo[0].publisher, textFour: books[0].volumeInfo[0].publishDate)
        
        return cell
    }
    
}

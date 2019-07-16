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
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var service = Service()
    var books: [Items] = []
    enum Screen: CGFloat {
        case fade, unfade
    }
    var firstPage: Bool = true
    var searchTerm: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.downloadJSON { [weak self](item) in
        self?.books = item.items
            DispatchQueue.main.async {
                if self?.CollectionView != nil {
                        self?.CollectionView.reloadData()
                }
                if self?.TableView != nil {
                    self?.TableView.reloadData() }
            }
        }
        let tableNib = UINib(nibName: "TableViewCell", bundle: nil)
        let collectionNib = UINib(nibName: "CollectionViewCell", bundle: nil)
        if  TableView != nil  {
            TableView.register(tableNib, forCellReuseIdentifier: "tableViewCell")
        }
        if CollectionView != nil {
            CollectionView.register(collectionNib, forCellWithReuseIdentifier: "collectionViewCell")
        }
        setUpSearchBar()
    }
    

    @IBAction func switchAction(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            firstView.alpha = Screen.fade.rawValue
            secondView.alpha = Screen.unfade.rawValue
        } else {
            firstView.alpha = Screen.unfade.rawValue
            secondView.alpha = Screen.fade.rawValue
        }
    }
}

extension ViewController: UISearchBarDelegate {
    private func setUpSearchBar() {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        service.searchTerm = searchBar.text ?? ""
        if CollectionView != nil {
            CollectionView.reloadData()
        }
        if TableView != nil {
            TableView.reloadData() }
     //  searchTerm = text
    }
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
      //  <#code#>
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        let book = books[indexPath.row].volumeInfo
        cell.customInit(imageString: book.imageLinks.thumbnail, textOne: book.title, textTwo: book.authors[0], textThree: (book.publisher ?? ""), textFour: (book.publishedDate ?? ""))
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
        let book = books[indexPath.row].volumeInfo
        cell.customInit(textOne: book.title, textTwo: book.authors[0], textThree: (book.publisher ?? ""), textFour: (book.publishedDate ?? "") )
        
        return cell
    }
    
}

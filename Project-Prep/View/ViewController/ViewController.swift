//
//  ViewController.swift
//  Project-Prep
//
//  Created by MAC Consultant on 7/7/19.
//  Copyright © 2019 MAC Consultant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
 
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var segmentSwitch: UISegmentedControl!
    
    var service = Service()
    var books: [Items] = []
    enum Screen: CGFloat {
        case fade, unfade
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if tableView != nil {
            tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "tableViewCell") }
        if collectionView != nil {
            collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionViewCell") }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.serviceCall(searchString: "")
    }
    
    func serviceCall (searchString: String) {
        service.downloadJSON(searchTerm: searchString) { [weak self](item) in
            if item.items != nil {
                self?.books = item.items!  }
            else {
                return
            }
        DispatchQueue.main.async {
            self?.collectionView.reloadData()
            self?.tableView.reloadData()
        }
    }
    }
    
    @IBAction func switchAction(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            tableView.alpha = Screen.fade.rawValue
            collectionView.alpha = Screen.unfade.rawValue
        } else {
            tableView.alpha = Screen.unfade.rawValue
            collectionView.alpha = Screen.fade.rawValue
        }
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            let title = searchText
            self.serviceCall(searchString: title.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? "")
        }
}
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        let book = books[indexPath.row].volumeInfo
        cell.customInit(imageString: book.imageLinks?.thumbnail ?? "", textOne: book.title ?? "", textTwo: book.authors?[0] ?? "", textThree: (book.publisher ?? ""), textFour: (book.publishedDate ?? ""))
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
        cell.customInit(textOne: book.title ?? "", textTwo: book.authors?[0] ?? "", textThree: (book.publisher ?? ""), textFour: (book.publishedDate ?? "") )
        
        return cell
    }
    
}

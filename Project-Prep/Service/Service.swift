//
//  Service.swift
//  Project-Prep
//
//  Created by MAC Consultant on 7/3/19.
//  Copyright © 2019 MAC Consultant. All rights reserved.
//

import UIKit


class serviceLayer {
    
    let booksURL = "https://www.googleapis.com/books/v1/volumes?q=MarkTwain"
    
    func downloadJSON() {
        
        guard let downloadURL = URL(string: booksURL) else {
            print("invalid URL address")
            return
        }
        
        let completion: (Data?, URLResponse?, Error?)->Void = { (data, urlResponse, error) in
            if error != nil {
                print("Something is wrong with the download")
                return
            }
            guard let data = data, urlResponse != nil else {
                print("JSON not responding")
                return
            }
            do {
                let book = try JSONDecoder().decode(Items.self, from: data)
                print(book.volumeInfo[0].title)
            }
            catch let jsonError {
                print("Something wrong with JSON", jsonError)
            }
        }
        
        URLSession.shared.dataTask(with: downloadURL, completionHandler: completion).resume()
    }
    
}


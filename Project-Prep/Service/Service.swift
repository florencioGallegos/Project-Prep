//
//  Service.swift
//  Project-Prep
//
//  Created by MAC Consultant on 7/3/19.
//  Copyright © 2019 MAC Consultant. All rights reserved.
//

import UIKit


class Service {
    
    
    let booksURL = "https://www.googleapis.com/books/v1/volumes?q="
    var searchTerm = "John F Kennedy"
    
    func downloadJSON(completionHandler: @escaping (Books) -> Void ) {
        
        let trimmedSearchTerm = searchTerm.replacingOccurrences(of: " ", with: "")
        let urlString: String = booksURL + trimmedSearchTerm
        
        guard let downloadURL = URL(string: urlString) else {
            print("invalid URL address")
            return
        }
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("something is wrong with the download")
                return
        }
            do {
                let decoder = JSONDecoder()
                let downloadbooks = try decoder.decode(Books.self, from: data)
                completionHandler(downloadbooks)
            } catch {
                print("there is something wrong with the JSON")
            }
        }.resume()
    }
    
}


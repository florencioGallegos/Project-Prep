//
//  Service.swift
//  Project-Prep
//
//  Created by MAC Consultant on 7/3/19.
//  Copyright © 2019 MAC Consultant. All rights reserved.
//

import Foundation

class serviceLayer {
    
    private var book  = [Book]()}
    let bookURL = "https://www.googleapis.com/books/v1/volumes?q=MarkTwain"

func downloadJSON() {

    guard let downloadURL = URL(string: bookURL) else {
        print("invalid URL address")
        return
    }
    URLSession.shared.dataTask(with: downloadURL) { data, urLResponse, error in
        guard let data = data, error == nil, urLResponse != nil else
        {
            print("Something is wrong with the download")
            return
        }
        do {
            let decoder = JSONDecoder()
            let downloadedBooks = try decoder.decode(Book.self, from: data)
                //         if downloadedCocktails.drinks[0].strIngredient1 != "" {
                //            measIng[0] =                }
            }
            DispatchQueue.main.async {
                self.Table.reloadData()
            }
        }
        catch  {
            print("Something wrong with JSON")
        }
    ;.resume()}
}

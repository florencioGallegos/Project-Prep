//
//  File.swift
//  Project-Prep
//
//  Created by MAC Consultant on 7/3/19.
//  Copyright © 2019 MAC Consultant. All rights reserved.
//

import Foundation

struct items: Codable {
    
    let volumeInfo: [Book]
    
}

class Book: Codable {
    
    let title: String
    let authors: [Author]
    let publisher: String
    let publishDate: String
    let description: String
    
    init (title: String, authors: [Author], publisher: String, publishDate: String, description: String)  {
        self.title = title
        self.authors = authors
        self.publisher = publisher
        self.publishDate = publishDate
        self.description = description
    }
}
    


struct Author: Codable {
    
    let first: String?
    let second: String?
    
}

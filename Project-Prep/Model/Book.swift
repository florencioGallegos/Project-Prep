//
//  File.swift
//  Project-Prep
//
//  Created by MAC Consultant on 7/3/19.
//  Copyright © 2019 MAC Consultant. All rights reserved.
//

import Foundation

struct Items: Decodable {
    
    let volumeInfo: [Book]
    
}

struct Book: Decodable {
    
    let title: String
    let authors: [String]
    let publisher: String
    let publishDate: String
    let description: String
    
    init (title: String, authors: [String], publisher: String, publishDate: String, description: String)  {
        self.title = title
        self.authors = authors
        self.publisher = publisher
        self.publishDate = publishDate
        self.description = description
    }
}
    

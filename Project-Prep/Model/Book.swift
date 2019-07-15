//
//  File.swift
//  Project-Prep
//
//  Created by MAC Consultant on 7/3/19.
//  Copyright © 2019 MAC Consultant. All rights reserved.
//

import Foundation

struct Books: Decodable {

let items: [Items]
}

struct Items: Decodable {
    
    let volumeInfo: Book
    
}

struct Book: Decodable {
    
    let title: String
    let authors: [String]
    let publisher: String?
    let publishedDate: String?
    let description: String?
    let imageLinks: Links
}

struct Links: Decodable {
    let smallThumbnail: String
    let thumbnail: String
}

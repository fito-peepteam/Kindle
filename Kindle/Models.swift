//
//  Models.swift
//  Kindle
//
//  Created by Fito Toledano on 11/24/19.
//  Copyright © 2019 PEEP TECHNOLOGIES SL. All rights reserved.
//

import UIKit

class Page {
    let number: Int
    let text: String
    
    init(number: Int, body: String) {
        self.number = number
        self.text = body
    }
}

class Book {
    let title: String
    let author: String
    let coverImageURL: String
    let pages: [Page]
    
    init(dictionary: [String: Any]) {
        self.title = dictionary["title"] as? String ?? ""
        self.author = dictionary["author"] as? String ?? ""
        self.coverImageURL = dictionary["String"] as? String ?? ""
        
        var bookPages = [Page]()
        
        if let pagesDictionary = dictionary["pages"] as? [[String: Any]] {
            for pageDictionary in pagesDictionary {
                if let pageText = pageDictionary["text"] as? String, let pageNumber = pageDictionary["id"] as? Int {
                    let page = Page(number: pageNumber, body: pageText)
                    bookPages.append(page)
                }
            }
        }
        
        
        
        self.pages = bookPages
    }
}

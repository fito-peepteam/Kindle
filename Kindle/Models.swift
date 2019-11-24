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
    let image: UIImage
    let pages: [Page]
    
    init(title: String, author: String, image: UIImage, pages: [Page]) {
        self.title = title
        self.author = author
        self.image = image
        self.pages = pages
    }
}

//
//  ViewController.swift
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
    let pages: [Page]
    
    init(title: String, author: String, pages: [Page]) {
        self.title = title
        self.author = author
        self.pages = pages
    }
}

class ViewController: UIViewController {

    func setupPages(){
        let page1 = Page(number: 1, body: "This is Page1")
        let page2 = Page(number: 2, body: "This is Page2")
        
        let pages = [page1, page2]
        
        setupBook(withPages: pages)
    }
    
    func setupBook(withPages pages:[Page]){
        let book = Book(title: "Steve Jobs", author: "Walter Isaacson", pages: pages)

        for page in book.pages {
            print(page.text)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupPages()
    }


}


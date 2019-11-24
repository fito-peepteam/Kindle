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

class BooksTable: UITableViewController {

    var books: [Book]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        setupPages()
    }
    
    func setupPages(){
        let page1 = Page(number: 1, body: "This is Page1")
        let page2 = Page(number: 2, body: "This is Page2")
        let page3 = Page(number: 3, body: "This is Page3")
        let page4 = Page(number: 4, body: "This is Page4")
        
        let pages = [page1, page2, page3, page4]
        
        setupBook(withPages: pages)
    }
    
    func setupBook(withPages pages:[Page]){
        
        let sjobsPages = [pages[0], pages[1]]
        let gatesPages = [pages[2], pages[3]]
        
        let book1 = Book(
            title: "Steve Jobs",
            author: "Walter Isaacson",
            pages: sjobsPages)

        let book2 = Book(title: "Bill Gates: A Biography",
                         author: "Michael Becraft",
                         pages: gatesPages)
        
        books = [book1, book2]
                
        // Safely unwrapping books without using the ! operator.
        if let safeBooks = books {
            for book in safeBooks  {
                print("Title: \(book.title), by: \(book.author)")
                print("Number of pages: \(pages.count)")
                
                for page in book.pages {
                    print("Page #\(page.number)")
                    print(page.text)
                }
                print("End of the book")
            }
        }

    }
    
    


}


//
//  ViewController.swift
//  Kindle
//
//  Created by Fito Toledano on 11/24/19.
//  Copyright © 2019 PEEP TECHNOLOGIES SL. All rights reserved.
//

import UIKit

class BooksTable: UITableViewController {

    var books: [Book]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did Load")
        
        navigationItem.title = "Kindle"
        view.backgroundColor = .white
        
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "testCell")
        
        cell.textLabel?.text = books?[indexPath.row].title
        cell.detailTextLabel?.text = books?[indexPath.row].author
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let numberOfBooks = books?.count {
            return numberOfBooks
        } else {
            return 0
        }
    }

}


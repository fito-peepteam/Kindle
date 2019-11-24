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
        overrideUserInterfaceStyle = .light
        
        tableView.register(BookCell.self, forCellReuseIdentifier: "bookCell")
        tableView.tableFooterView = UIView()
        
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
            image: UIImage(named: "SteveJobs")!, // using ! operator because I know the image is there & time constraints.
            pages: sjobsPages)

        let book2 = Book(title: "Bill Gates: A Biography",
                         author: "Michael Becraft",
                         image: UIImage(named: "BillGates")!, // using ! operator because I know the image is there & time constraints.
                         pages: gatesPages)
        
        books = [book1, book2]

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookCell
        
        let book = books?[indexPath.row]
        cell.book = book
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let books = books {
            print("Selected Book: \(books[indexPath.row].title)")
            print("Author: \(books[indexPath.row].author)")
            
            let layout = UICollectionViewFlowLayout()
            let pagesCollectionVC = UICollectionViewController(collectionViewLayout: layout) //(frame: screenFrame, collectionViewLayout: layout)
            present(pagesCollectionVC, animated: true, completion: nil)
            
            tableView.deselectRow(at: indexPath, animated: false) // so the cell stays clear
            
        }
        
        
        
    }

}


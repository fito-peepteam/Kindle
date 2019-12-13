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
        
        fetchBooks()
    }
    
    func fetchBooks(){
        print("Fetching books...")
        
        if let url = URL(string: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json") {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    if let data = data {
                        
                        do {
                            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                            
                            guard let bookDictionaries = json as? [[String: Any]] else { return }
                            
                            self.books = []
                            
                            for bookDictionary in bookDictionaries {
                                let book = Book(dictionary: bookDictionary)
                                self.books?.append(book)
                            }
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                            
                        } catch let jsonError {
                            print("There was a JSON Error", jsonError)
                        }
                        
                    }
                }
            }.resume()
            
            
        }

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
            let pagesCollectionVC = BookPagerController(collectionViewLayout: layout)
            pagesCollectionVC.pages = books[indexPath.row].pages
            
            present(pagesCollectionVC, animated: true, completion: nil)
            
            tableView.deselectRow(at: indexPath, animated: true) // so the cell stays clear            
        }

    }

}


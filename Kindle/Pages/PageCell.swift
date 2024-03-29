//
//  PageCell.swift
//  Kindle
//
//  Created by Fito Toledano on 11/24/19.
//  Copyright © 2019 PEEP TECHNOLOGIES SL. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            pageNumber.text = "\(page?.number ?? 0)"
            body.text = page?.text
        }
    }
    
    let body: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pageNumber: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(body)
        body.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        body.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        body.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        body.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -60).isActive = true
        
        addSubview(pageNumber)
        pageNumber.topAnchor.constraint(equalTo: body.bottomAnchor, constant: 8).isActive = true
        pageNumber.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        pageNumber.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        pageNumber.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        
        pageNumber.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

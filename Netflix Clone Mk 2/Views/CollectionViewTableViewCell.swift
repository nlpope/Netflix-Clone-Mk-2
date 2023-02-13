//
//  CollectionViewTableViewCell.swift
//  Netflix Clone Mk 2
//
//  Created by Noah Pope on 2/13/23.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    static let identifier = "CollectionViewTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .blue
    }
    
    //i dont get this line
    required init?(coder: NSCoder) {
        fatalError()
    }

}

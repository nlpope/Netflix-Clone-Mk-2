//
//  CollectionViewTableViewCell.swift
//  Netflix Clone Mk 2
//
//  Created by Noah Pope on 2/13/23.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    static let identifier = "CollectionViewTableViewCell"
    
    private let collectionViewz: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        return collectionView
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionViewz)
        
        collectionViewz.delegate = self
        collectionViewz.dataSource = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionViewz.frame = contentView.bounds
    }
    
    //i dont get this line
    required init?(coder: NSCoder) {
        fatalError()
    }

}

extension CollectionViewTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
       
    //setting how many cells/boxes (lined horizontally) in each collection view per row
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .green
        return cell
    }
    
    
}

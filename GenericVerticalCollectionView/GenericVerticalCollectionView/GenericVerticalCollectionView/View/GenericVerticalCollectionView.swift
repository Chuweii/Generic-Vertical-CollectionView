//
//  GenericVerticalCollectionView.swift
//  GenericVerticalCollectionView
//
//  Created by Wei Chu on 2022/11/19.
//

import UIKit

class GenericVerticalCollectionView< T , Cell:UICollectionViewCell >: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //MARK: Properties
    
    var items = [T]()
    var configure : (GameCollectionViewCell , T, IndexPath) -> Void
    var selecedHandler : (T) -> Void
//    var id :String
    
    //MARK: init
    
    init(width:CGFloat,height:CGFloat, items: [T], configure: @escaping (GameCollectionViewCell, T, IndexPath) -> Void, selecedHandler: @escaping (T) -> Void) {
        
        self.configure = configure
        self.selecedHandler = selecedHandler
        self.items = items
//        self.id = id
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width, height: height)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
//        self.translatesAutoresizingMaskIntoConstraints = false
        self.register(GameCollectionViewCell.self, forCellWithReuseIdentifier: GameCollectionViewCell.identifier)
        self.dataSource = self
        self.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Collection View
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = self.dequeueReusableCell( withReuseIdentifier: GameCollectionViewCell.identifier, for: indexPath) as! Cell
        
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: GameCollectionViewCell.identifier, for: indexPath) as? GameCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let item = items[indexPath.row]
        
        configure( cell , item, indexPath)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        selecedHandler(item)
    }
}

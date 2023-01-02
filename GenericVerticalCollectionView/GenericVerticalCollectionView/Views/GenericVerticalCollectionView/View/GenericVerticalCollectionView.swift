//
//  GenericVerticalCollectionView.swift
//  GenericVerticalCollectionView
//
//  Created by Wei Chu on 2022/11/19.
//

import UIKit

class GenericVerticalCollectionView< T , Cell:UICollectionViewCell >: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //MARK: - Properties
    
    var items = Dynamic([T]())
    var configure: (Cell ,IndexPath) -> Void
    var selectHandler: (T, IndexPath) -> Void
    
    //MARK: - init
    
    init(items: [T], cellWidth: CGFloat, cellHight:CGFloat, direction:UICollectionView.ScrollDirection, configure: @escaping (Cell ,IndexPath) -> Void, selectHandler: @escaping (T, IndexPath) -> Void ) {
        self.items.value = items
        self.configure = configure
        self.selectHandler = selectHandler
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = direction
        layout.itemSize = CGSize(width: cellWidth, height: cellHight)
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        
        super.init(frame: .zero, collectionViewLayout: layout)
        self.register(cellType: Cell.self)
        self.dataSource = self
        self.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Autolayout
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        
    }
    
    //MARK: - Collection View
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.value.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        let cell = self.dequeueReusableCell(for: indexPath) as Cell
        
        cell.backgroundColor = .gray
        configure(cell ,indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items.value[indexPath.row]
        selectHandler(item, indexPath)
    }
}

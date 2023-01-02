//
//  UICollectionView+.swift
//  MVVM CollectionView
//
//  Created by NeferUser on 2022/12/27.
//

import UIKit

extension UICollectionView {
    
    /// 註冊一個 Class-Based "UICollectionView Cell" 的 subclass
    final func register<T: UICollectionViewCell>(cellType: T.Type) {
        self.register(cellType.self, forCellWithReuseIdentifier: cellType.id)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: cellType.id, for: indexPath) as? T else {
            fatalError(
                "Failed to dequeue a cell with identifier \(cellType.id) matching type \(cellType.self). "
                + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                + "and that you registered the cell beforehand"
            )
        }
        return cell
    }
}

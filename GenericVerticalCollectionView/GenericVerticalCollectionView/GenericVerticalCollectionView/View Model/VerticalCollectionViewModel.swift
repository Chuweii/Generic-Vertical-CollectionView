//
//  VerticalCollectionViewModel.swift
//  MVVM CollectionView
//
//  Created by NeferUser on 2022/11/17.
//

import Foundation

class VerticalCollectionViewModel{
    
    var model = Dynamic([Number]())
    
    func fetchNumberData (completion: @escaping ([Number]) -> Void) {
        GetData.shared.getNumber { [weak self] number in
            self?.model.value = number
            completion(number)
        }
    }
}

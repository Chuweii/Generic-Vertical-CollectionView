//
//  VerticalCollectionViewModel.swift
//  MVVM CollectionView
//
//  Created by NeferUser on 2022/11/17.
//

import Foundation

class VerticalCollectionViewModel{
    
    var model = Number(number: [])
    
    func fetchNumberData (completion: @escaping (Number) -> Void) {
        GetData.shared.getNumber { number in
            self.model = number
            completion(number)
        }
    }
    
}

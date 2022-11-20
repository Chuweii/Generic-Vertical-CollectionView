//
//  GetData.swift
//  CollectionView MVVMDemo
//
//  Created by NeferUser on 2022/11/15.
//

import Foundation

class GetData{
    
    static let shared = GetData()
    
    func getNumber(completion:@escaping (Number) -> Void){
    
        var number = Number(number: [])
        
        for i in 1...99{
            number.number.append("\(i)")
            completion(number)
        }
    }
    
}

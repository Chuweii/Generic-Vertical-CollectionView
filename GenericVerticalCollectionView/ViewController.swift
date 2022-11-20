//
//  ViewController.swift
//  GenericVerticalCollectionView
//
//  Created by Wei Chu on 2022/11/19.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel = VerticalCollectionViewModel()
    
    //MARK: Element
    
    private lazy var collectionView = GenericVerticalCollectionView( width: view.frame.size.width / 2 - 1, height: view.frame.size.height / 5, items: viewModel.model.number) { cell , item , indexpath in
        
        cell.backgroundColor = .systemPink
        cell.configure(viewModel: self.viewModel, indexpath: indexpath)
        
    } selecedHandler: { item in
        print(item)
    }
    
    //MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        setView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    private func setView () {
        view.backgroundColor = .red
        view.addSubview(collectionView)
    }
    
    //MARK: Data
    
    private func getData () {
        viewModel.fetchNumberData { number in
            //
        }
    }

}


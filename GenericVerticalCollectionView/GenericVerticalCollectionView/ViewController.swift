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
    
    private lazy var collectionView = GenericVerticalCollectionView( width: view.frame.size.width / 2 - 15, height: view.frame.size.height / 7.5, items: viewModel.model.number) { cell , item , indexpath in
        
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
//        setConstraints()
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
    
//    private func setConstraints () {
//
//        let collectionviewConstraints = [
//            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor ,constant: 0),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 3),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -3),
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
//
//        ]
//
//        NSLayoutConstraint.activate(collectionviewConstraints)
//    }

}


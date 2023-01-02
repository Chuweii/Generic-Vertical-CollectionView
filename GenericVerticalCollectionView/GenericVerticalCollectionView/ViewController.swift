//
//  ViewController.swift
//  GenericVerticalCollectionView
//
//  Created by Wei Chu on 2022/11/19.
//

import UIKit

class ViewController: UIViewController {
    var viewModel = VerticalCollectionViewModel()
    
    //MARK: - Element
    
    private lazy var collectionView = GenericVerticalCollectionView(items: viewModel.model.value, cellWidth: view.frame.width / 3 - 2, cellHight: view.frame.height / 5, direction: .vertical) { (cell: GameCollectionViewCell , indexpath) in
        
        cell.configUI(model: self.viewModel.model.value[indexpath.row] , indexpath: indexpath)
    } selectHandler: { [weak self] (item, indexPath) in
        print(item)
    }
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        request()
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    private func request() {
        viewModel.fetchNumberData { number in
            //
        }
    }
}


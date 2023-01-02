//
//  ViewController.swift
//  GenericVerticalCollectionView
//
//  Created by Wei Chu on 2022/11/19.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - View Model
    
    var viewModel = VerticalCollectionViewModel()
    
    //MARK: - Element
    
    private lazy var collectionView = GenericVerticalCollectionView(items: viewModel.model.value, cellWidth: view.frame.width / 3 - 2, cellHight: view.frame.height / 5, direction: .vertical) { (cell: GameCollectionViewCell , indexpath) in
        
        cell.configUI(model: self.viewModel.model.value[indexpath.row] , indexpath: indexpath)
    } selectHandler: { [weak self] (item, indexPath) in
        print(item)
        let vc = SecondViewController()
        self?.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller"
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


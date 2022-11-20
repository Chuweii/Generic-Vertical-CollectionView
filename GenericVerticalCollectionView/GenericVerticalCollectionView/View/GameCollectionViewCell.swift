//
//  GameCollectionViewCell.swift
//  GenericVerticalCollectionView
//
//  Created by Wei Chu on 2022/11/20.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "GameCollectionViewCell"
    
    //MARK: Element
    
    private lazy var gameLabel: UILabel = {
       
        lazy var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 21, weight: .light)
        label.textAlignment = .center
//        label.textColor = .
        label.text = "Weber"
        
        return label
    }()
    
    private lazy var gameImageView: UIImageView = {
       
        lazy var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .blue
        
        return image
    }()
    
    private lazy var cornerImageView: UIImageView = {
       
        lazy var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .green
        
        return image
    }()

    
    //MARK: init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        setConstraints()
    }
    
    //MARK: Set View & Autolayout
    
    private func setView () {
        contentView.addSubview(gameLabel)
        contentView.addSubview(gameImageView)
        contentView.addSubview(cornerImageView)
    }
 
    private func setConstraints () {
        let gameLabelConstraints = [
            gameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            gameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            gameLabel.widthAnchor.constraint(equalToConstant: 100),
            gameLabel.heightAnchor.constraint(equalToConstant: 50)
            
        ]
        
        let gameImageViewConstraints = [
            gameImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            gameImageView.trailingAnchor.constraint(equalTo: gameLabel.leadingAnchor, constant: -10),
            gameImageView.widthAnchor.constraint(equalToConstant: 20),
            gameImageView.heightAnchor.constraint(equalToConstant: 20)
        ]
        // layout元件繼續
        let cornerImageViewConstraints = [
            cornerImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cornerImageView.trailingAnchor.constraint(equalTo: gameLabel.leadingAnchor, constant: -10),
            cornerImageView.widthAnchor.constraint(equalToConstant: 20),
            cornerImageView.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        NSLayoutConstraint.activate(gameLabelConstraints)
        NSLayoutConstraint.activate(gameImageViewConstraints)
    }
    
    //MARK: Public Function
    
    public func configure (viewModel:VerticalCollectionViewModel, indexpath:IndexPath) {
        gameLabel.text = viewModel.model.number[indexpath.row]
    }

}

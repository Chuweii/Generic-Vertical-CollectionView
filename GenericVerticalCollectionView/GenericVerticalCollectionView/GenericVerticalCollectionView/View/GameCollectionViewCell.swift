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
    
    private let gameLabel: UILabel = {
       
        lazy var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 21, weight: .light)
        label.textAlignment = .center
        label.text = ""
        
        return label
    }()
    
    private let gameImageView: UIImageView = {
       
        lazy var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .blue
        
        return image
    }()
    
    private let cornerImageView: UIImageView = {
       
        lazy var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .green
        
        return image
    }()
    
     private lazy var button: UIButton = {
       
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
    
        
        return button
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
        self.backgroundColor = .lightGray
        contentView.addSubview(gameLabel)
        contentView.addSubview(gameImageView)
        contentView.addSubview(cornerImageView)
        contentView.addSubview(button)
    }
 
    private func setConstraints () {
        let gameLabelConstraints = [
            gameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            gameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            gameLabel.widthAnchor.constraint(equalToConstant: contentView.frame.size.width / 3),
            gameLabel.heightAnchor.constraint(equalToConstant: contentView.frame.size.width / 3)
            
        ]
        
        let gameImageViewConstraints = [
            gameImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            gameImageView.trailingAnchor.constraint(equalTo: gameLabel.leadingAnchor, constant: -5),
            gameImageView.widthAnchor.constraint(equalToConstant: contentView.frame.size.width / 3 - 20),
            gameImageView.heightAnchor.constraint(equalToConstant: contentView.frame.size.width / 3 - 20)
        ]
        let cornerImageViewConstraints = [
            cornerImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            cornerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            cornerImageView.widthAnchor.constraint(equalToConstant: 30),
            cornerImageView.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        let buttonConstraints = [
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            button.leadingAnchor.constraint(equalTo: gameLabel.trailingAnchor, constant: 7),
            button.widthAnchor.constraint(equalToConstant: 40),
            button.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(gameLabelConstraints)
        NSLayoutConstraint.activate(gameImageViewConstraints)
        NSLayoutConstraint.activate(cornerImageViewConstraints)
        NSLayoutConstraint.activate(buttonConstraints)
    }
    
    //MARK: Public Function
    
    public func configUI (model:Number, indexpath:IndexPath) {
        gameLabel.text = model.number
    }
}

//
//  UIView+.swift
//  MVVM CollectionView
//
//  Created by NeferUser on 2022/12/27.
//

import UIKit

extension UIView {
    static var id: String {
        return String(describing: self)
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
    
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        
        self.layer.add(animation, forKey: nil)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIView.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
    //用於tableViewCell和collectionViewCell
    
    func roundCorners(_ corners:CACornerMask, radius: CGFloat) {
        self.layer.cornerRadius = radius
        //        self.layer.maskedCorners = corners
    }
    
    // Using a function since `var image` might conflict with an existing variable
    // (like on `UIImageView`)
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
    
    func setFrameY(_ y: CGFloat) {
        self.frame = CGRect(x: self.frame.minX, y: y, width: self.frame.width, height: self.frame.height)
    }
    
    
    enum ViewBorder: String {
        case left = "borderLeft"
        case right = "borderRight"
        case top = "borderTop"
        case bottom = "borderBottom"
    }
    
    func addBorder(edge: ViewBorder, color: UIColor = .hexColor("f0eff0"), borderWidth: CGFloat = 1){
        
        //添加前先確認是否有重複
        removeBorder(border: edge)
        
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.name = edge.rawValue
        
        switch edge {
            case .top:
                border.frame = CGRect(x: 0, y: 0, width: frame.width, height: borderWidth)
            case .bottom:
                border.frame = CGRect(x: 0, y: frame.height - borderWidth, width: frame.width, height: borderWidth)
            case .left:
                border.frame = CGRect(x: 0, y: 0, width: borderWidth, height: frame.height)
            case .right:
                border.frame = CGRect(x: frame.width - borderWidth, y: 0, width: borderWidth, height: frame.height)
        }
        
        layer.addSublayer(border)
    }
    
    func removeBorder(border: ViewBorder) {
        var layerForRemove: CALayer?
        
        for layer in self.layer.sublayers! {
            if layer.name == border.rawValue {
                layerForRemove = layer
            }
        }
        
        if let layer = layerForRemove {
            layer.removeFromSuperlayer()
        }
    }
}


extension CALayer {
    
    enum ViewBorder: String {
        case left = "borderLeft"
        case right = "borderRight"
        case top = "borderTop"
        case bottom = "borderBottom"
    }
    
    func addBorder(edge: ViewBorder, color: UIColor = .hexColor("f0eff0"), borderWidth: CGFloat = 1){
        
        //添加前先確認是否有重複
        removeBorder(border: edge)
        
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.name = edge.rawValue
        
        switch edge {
            case .top:
                border.frame = CGRect(x: 0, y: 0, width: frame.width, height: borderWidth)
            case .bottom:
                border.frame = CGRect(x: 0, y: frame.height - borderWidth, width: frame.width, height: borderWidth)
            case .left:
                border.frame = CGRect(x: 0, y: 0, width: borderWidth, height: frame.height)
            case .right:
                border.frame = CGRect(x: frame.width - borderWidth, y: 0, width: borderWidth, height: frame.height)
        }
        
        addSublayer(border)
    }
    
    func removeBorder(border: ViewBorder) {
        var layerForRemove: CALayer?
        
        for layer in sublayers! {
            if layer.name == border.rawValue {
                layerForRemove = layer
            }
        }
        
        if let layer = layerForRemove {
            layer.removeFromSuperlayer()
        }
    }
}


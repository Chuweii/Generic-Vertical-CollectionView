//
//  UIColor+.swift
//  MVVM CollectionView
//
//  Created by NeferUser on 2022/12/27.
//

import UIKit

extension UIColor {
    
    static var color_212121: UIColor {
        return UIColor.colorRGB(21, 21, 21, a: 1)
    }
    
    static var BFBlack = colorRGB(0xdd, 0xdd, 0xdd)

    static var BFSecondarySystemBackground = colorRGB(242, 242, 247)
    
    /**
     *   中黑色 666666  102
     */
    static var BFTextColorB3 = colorRGB(0x66, 0x66, 0x66)

    static var BFTextTodayProfitDetail = colorRGB(39, 39, 39)
    
    static var BFMaimRed = UIColor(red: 0xcd/255, green: 0x3c/255, blue: 0x29/255, alpha: 1)
    
    static var safeThemeColor = UIColor.hexColor("ff962c")
    
}


extension UIColor {
    
    static func colorRGB(_ red: CGFloat,_ green: CGFloat,_ blue: CGFloat,a: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: a)
    }
    
    static func colorRGB(_ red: CGFloat,_ green: CGFloat,_ blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    class func hexColor(_ hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = String(cString.dropFirst())
        }
        
        //cString.count != 6，會報錯
        assert(cString.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

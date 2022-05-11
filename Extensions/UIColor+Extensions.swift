//
//  UIColor+Extensions.swift
//  OTTPlatform
//
//  Created by Daksh on 24/02/22.
//

import UIKit

extension UIColor {
    
    var hexCode: String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
    
    func makeCircle(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.setStrokeColor(UIColor.clear.cgColor)
        let bounds = CGRect(origin: .zero, size: size)
        context?.addEllipse(in: bounds)
        context?.drawPath(using: .fill)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

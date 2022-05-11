//
//  UIImage+Extensions.swift
//  OTTPlatform
//
//  Created by Dksh on 27/02/22.
//  Copyright © 2022 Joker. All rights reserved.
//

import UIKit

extension UIImage
{
    var scaleAndRotateImage : UIImage {
        
        let kMaxResolution = self.size.width > self.size.height ? self.size.width : self.size.height
        let imgRef = self.cgImage
        let width = CGFloat(imgRef!.width)
        let height = CGFloat(imgRef!.height)
        var transform = CGAffineTransform.identity
        var bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        if width > kMaxResolution || height > kMaxResolution {
            let ratio: CGFloat = width / height
            if ratio > 1 {
                bounds.size.width = kMaxResolution
                bounds.size.height = bounds.size.width / ratio
            } else {
                bounds.size.height = kMaxResolution
                bounds.size.width = bounds.size.height * ratio
            }
        }
        
        let scaleRatio = bounds.size.width / width
        let imageSize = CGSize(width: imgRef!.width, height: imgRef!.height)
        var boundHeight: CGFloat
        
        let orient: UIImage.Orientation = self.imageOrientation
        switch orient {
        case .up:
            transform = CGAffineTransform.identity
        case .down:
            transform = CGAffineTransform(translationX: imageSize.width, y: imageSize.height)
            transform = transform.rotated(by: .pi)
        case .left:
            boundHeight = bounds.size.height
            bounds.size.height = bounds.size.width
            bounds.size.width = boundHeight
            transform = CGAffineTransform(translationX: 0.0, y: imageSize.width)
            transform = transform.rotated(by: 3.0 * .pi / 2.0)
        case .right:
            boundHeight = bounds.size.height
            bounds.size.height = bounds.size.width
            bounds.size.width = boundHeight
            transform = CGAffineTransform(translationX: imageSize.height, y: 0.0)
            transform = transform.rotated(by: .pi / 2.0)
            
        case .upMirrored:
            transform = CGAffineTransform(translationX: imageSize.width, y: 0.0)
            transform = transform.scaledBy(x: -1.0, y: 1.0)
        case .downMirrored:
            transform = CGAffineTransform(translationX: 0.0, y: imageSize.height)
            transform = transform.scaledBy(x: 1.0, y: -1.0)
        case .leftMirrored:
            boundHeight = bounds.size.height
            bounds.size.height = bounds.size.width
            bounds.size.width = boundHeight
            transform = CGAffineTransform(translationX: imageSize.height, y: imageSize.width)
            transform = transform.scaledBy(x: -1.0, y: 1.0)
            transform = transform.rotated(by: 3.0 * .pi / 2.0)
        case .rightMirrored:
            boundHeight = bounds.size.height
            bounds.size.height = bounds.size.width
            bounds.size.width = boundHeight
            transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            transform = transform.rotated(by: .pi / 2.0)
        @unknown default:
            break
        }
        
        UIGraphicsBeginImageContext(bounds.size)
        let context = UIGraphicsGetCurrentContext()
        if orient == .right || orient == .left {
            context?.scaleBy(x: -scaleRatio, y: scaleRatio)
            context?.translateBy(x: -height, y: 0)
        } else {
            context?.scaleBy(x: scaleRatio, y: -scaleRatio)
            context?.translateBy(x: 0, y: -height)
        }
        
        context?.concatenate(transform)
        UIGraphicsGetCurrentContext()?.draw(imgRef!, in: CGRect(x: 0, y: 0, width: width, height: height))
        let imgCreated: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return imgCreated!
    }
    
    var resizedDynamicImage : UIImage {
        
        let sizeMax = UIScreen.main.bounds
        var imgResized: UIImage
        UIGraphicsEndImageContext()
        
        if self.size.width > self.size.height {
            let scaleFactor = sizeMax.width / self.size.width
            let newHeight = self.size.height * scaleFactor
            let newWidth = self.size.width * scaleFactor
            UIGraphicsBeginImageContext(CGSize(width: CGFloat(newWidth), height: CGFloat(newHeight)))
            self.draw(in: CGRect(x: 0, y: 0, width: CGFloat(newWidth), height: CGFloat(newHeight)))
            imgResized = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
        }
        else if self.size.width < self.size.height {
            let scaleFactor = sizeMax.width / self.size.height
            let newHeight = self.size.height * scaleFactor
            let newWidth = self.size.width * scaleFactor
            UIGraphicsBeginImageContext(CGSize(width: CGFloat(newWidth), height: CGFloat(newHeight)))
            self.draw(in: CGRect(x: 0, y: 0, width: CGFloat(newWidth), height: CGFloat(newHeight)))
            imgResized = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
        }
        else {
            imgResized = self
        }
        return imgResized
    }
    
    func resizedImage(_ sizeImage: CGSize) -> UIImage? {
        let frame = CGRect(origin: .zero, size: CGSize(width: sizeImage.width, height: sizeImage.height))
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
        self.draw(in: frame)
        let resizedImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}

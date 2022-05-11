//
//  Created by Daksh on 27/08/20.
//  Copyright © 2020 The One Technologies. All rights reserved.
//

import UIKit

extension UIView {
    
    func addShadow(color: UIColor = .black, offset: CGSize = .init(width: 1.0, height: 1.0), opacity: Float = 1.0, radius: CGFloat = 1.0) {
        self.layer.shadowColor   = color.cgColor
        self.layer.shadowOffset  = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius  = radius
    }
    
    static func loadFromNibName() -> Self {
        return Bundle.main.loadNibNamed(Self.className, owner: self, options: nil)?.first as! Self
    }
    
    func startBlink() {
        self.alpha = 1.0
        UIView.animate(withDuration: 0.7,
                       delay:0,
                       options:[.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat],
                       animations: {
            self.alpha = 0.0100000003 // 0 alpha = user interaction not work
        },completion: nil)
    }
    
    func stopBlink() {
        self.layer.removeAllAnimations()
        self.alpha = 1.0
    }
    
    func fadeIn(_ duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: nil)
    }
    
    
    func fadeOut(_ duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.alpha = 0.0
        }, completion: nil)
    }
    
    func roundedCorners(corners: UIRectCorner, radius: CGFloat, frame : CGRect? = nil) {
        let newRect : CGRect
        if let frame = frame {
            newRect = frame
        } else {
            newRect = self.bounds
        }
        let path = UIBezierPath(roundedRect: newRect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    class func animateView(withDuration duration: TimeInterval = 0.25, delay: TimeInterval = 0.0, usingSpringWithDamping dampingRatio: CGFloat = 1.0, initialSpringVelocity velocity: CGFloat = 0.8, options: UIView.AnimationOptions = [.curveEaseIn], animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity, options: options, animations: animations, completion: completion)
    }
    
    var parentController: UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.parentController
        } else {
            return nil
        }
    }
    
    func preventingScreenshot(_ disable: Bool = true) {
        DSLog.log()
        
        DispatchQueue.main.async {
            if disable {
                let field = UITextField()
                field.customIdentifier = "Screenshot"
                field.isSecureTextEntry = true
                self.addSubview(field)
                field.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
                field.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
                self.layer.superlayer?.addSublayer(field.layer)
                field.layer.sublayers?.first?.addSublayer(self.layer)
                return
            }
            
            guard let field = self.subviews.first(where: {$0.customIdentifier == "Screenshot"}) as? UITextField else { return }
            field.removeFromSuperview()
        }
    }
    
}

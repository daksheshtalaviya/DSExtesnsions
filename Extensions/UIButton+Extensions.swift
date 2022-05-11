//
//  Created by Daksh on 27/08/20.
//  Copyright © 2020 The One Technologies. All rights reserved.
//

import UIKit

@objc extension UIButton {
    
    func toUppercasedTitle() {
        self.setTitle(self.currentTitle?.localizedUppercase, for: .normal)
    }
    
    func enabled() {
        self.isUserInteractionEnabled = true
        self.alpha = 1.0
    }
    
    func disabled(_ alpha: CGFloat = 0.3) {
        self.isUserInteractionEnabled = false
        self.alpha = alpha
    }
    
    func animateJump() {
        self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 0.3, //The wobbliness of the spring animation. The closer the value to zero the more shaky the animation
                       initialSpringVelocity: 5.0, //Fast the animation shoots out in the beginning.
                       options: [.allowUserInteraction, .repeat, .autoreverse],
                       animations: { [weak self] in
                        self?.transform = .identity
            }, completion: nil)
    }
    
    func removeAnimations() {
        self.layer.removeAllAnimations()
    }
}

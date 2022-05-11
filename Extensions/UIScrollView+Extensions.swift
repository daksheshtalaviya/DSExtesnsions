//
//  UIScrollView+Extensions.swift
//  DS21
//
//  Created by Dksh on 17/09/21.
//  Copyright © 2021 Joker. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    var currentIndex: Int { Int(self.contentOffset.x / self.frame.width) }
    
}

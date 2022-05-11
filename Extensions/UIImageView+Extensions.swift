//
//  UIImageView+Extensions.swift
//  OTTPlatform
//
//  Created by Dksh on 13/03/22.
//  Copyright © 2022 Joker. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func setImageUrl(_ urlString: String?, placeholderImage: UIImage? = nil, options: SDWebImageOptions = .refreshCached, completed: SDExternalCompletionBlock? = nil) {
        self.sd_setImage(with: urlString?.url, placeholderImage: placeholderImage, options: options, completed: completed)
    }
}

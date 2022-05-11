//
//  UICollectionView+Extensions.swift
//  OTTPlatform
//
//  Created by Dksh on 12/03/22.
//  Copyright © 2022 Joker. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func registerNib<T: UICollectionViewCell>(type: T.Type, reuseIdentifier: String? = nil) {
        self.register(UINib.instantiateFromNib(name: type.className),
                      forCellWithReuseIdentifier: reuseIdentifier ?? type.className)
    }
    
    func reloadDataAsync() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
}

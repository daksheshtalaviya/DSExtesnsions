//
//  UIApplicationExt.swift
//  DS21
//
//  Created by theonetech on 20/01/22.
//  Copyright © 2022 Joker. All rights reserved.
//

import UIKit

extension UIApplication {
    
    var currentWindow: UIWindow? {
        windows.first(where: {$0.isKeyWindow}) ?? windows.first
    }
}

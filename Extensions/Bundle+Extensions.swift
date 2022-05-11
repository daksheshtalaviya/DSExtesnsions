//
//  Bundle+Extensions.swift
//  OTTPlatform
//
//  Created by Daksh on 24/02/22.
//

import Foundation

extension Bundle {
    
    var displayName: String? {
        if let dictInfo = self.infoDictionary, let strName = dictInfo["CFBundleDisplayName"] as? String {
            return strName
        }
        return nil
    }
    
    var projectName: String? {
        if let dictInfo = self.infoDictionary, let strName = dictInfo[kCFBundleNameKey as String] as? String {
            return strName
        }
        return nil
    }
    
    var versionMain: String? {
        if let dictInfo = self.infoDictionary, let strName = dictInfo["CFBundleShortVersionString"] as? String {
            return strName
        }
        return nil
    }
    
    var versionBundle: String? {
        if let dictInfo = self.infoDictionary, let strName = dictInfo[kCFBundleVersionKey as String] as? String {
            return strName
        }
        return nil
    }
    
    static func loadView<T: NSObject>(fromNib name: String? = nil, withType type: T.Type) -> T {
        let nibName = name ?? type.className
        if let view = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first as? T {
            return view
        }

        fatalError("Could not load view with type " + String(describing: type))
    }
}

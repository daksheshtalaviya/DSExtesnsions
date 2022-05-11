//
//  NSNotification+Extensions.swift
//  DS21
//
//  Created by Dksh on 03/09/21.
//  Copyright © 2021 Joker. All rights reserved.
//

import Foundation

extension NSNotification.Name {
    
    static let didUpdateMessages         = Self.init("NotifyDidUpdateMessages")
    static let didUpdateDownloadProgress = Self.init("NotifyDidUpdateDownloadProgress")
    static let didFinishedDownload       = Self.init("NotifyDidFinishedDownload")
}
